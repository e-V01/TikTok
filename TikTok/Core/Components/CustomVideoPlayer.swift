//
//  CustomVideoPlayer.swift
//  TikTok
//
//  Created by Y K on 01.12.2023.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false // cancles native playback
        controller.exitsFullScreenWhenPlaybackEnds = true // 
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill // makes video full screen
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
