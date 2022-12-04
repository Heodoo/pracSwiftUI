
import SwiftUI
import AVKit
import TVUIKit

// MARK: - VIDEO CONTROLLER

struct VideoPlayer : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) ->  UIViewController {
        
        let controller = AVPlayerViewController()
        
        controller.player = player
        controller.showsPlaybackControls = true
        controller.allowsPictureInPicturePlayback = true
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}
