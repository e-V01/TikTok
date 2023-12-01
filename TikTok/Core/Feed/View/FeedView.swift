//
//  FeedView.swift
//  TikTok
//
//  Created by Y K on 01.12.2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                        
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        // fixes next post on a screen, has to be and a ScrollView
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
