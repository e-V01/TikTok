//
//  FeedView.swift
//  TikTok
//
//  Created by Y K on 01.12.2023.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    // had to add state prop to handle error with sound
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear{ playInitialVideoIfNeeded()}
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.play()
        }
        .scrollPosition(id: $scrollPosition) // solution to separate simultenaous sound on all videos in case scrolling thru them all
        .scrollTargetBehavior(.paging)
        // fixes next post on a screen, has to be and a ScrollView
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    
    func playInitialVideoIfNeeded() {
        guard scrollPosition == nil,
              let posts = viewModel.posts.first,
              player.currentItem == nil else { return}
        
        let item = AVPlayerItem(url: URL(string: posts.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
