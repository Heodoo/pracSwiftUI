

import SwiftUI
import AVKit
import TVUIKit

struct Metadata {
    var title: String
    var subtitle: String
    var artwork: String
    var description: String
    var genre: String
    var rating: String
    var copyright: String
}

struct PlayerView: View {
    @State var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onDisappear {
                player.pause()
                player.replaceCurrentItem(with: nil)
            }
            .task {
                if let url = URL(string: "https://www.w3schools.com/html/mov_bbb.mp4") {
                    let playerItem = AVPlayerItem(url: url)
                    
                    let metadata: Metadata = Metadata(
                        title: "데모용 영상",
                        subtitle: "저작권 문제 없는 영상",
                        artwork: "Hello",
                        description: "데모를 위해 준비했습니다",
                        genre: "애니메이션",
                        rating: "전체연령가",
                        copyright: "오픈소스"
                    )
                    playerItem.externalMetadata = createMetadataItems(for: metadata)
                    
                    player.replaceCurrentItem(with: playerItem)
                    
                    player.play()
                }
            }
    }
    
    func createMetadataItems(for metadata: Metadata) -> [AVMetadataItem] {
        let mapping: [AVMetadataIdentifier: Any] = [
            .commonIdentifierTitle: metadata.title,
            .iTunesMetadataTrackSubTitle: metadata.subtitle,
            .commonIdentifierArtwork: UIImage(named: metadata.artwork)?.pngData() as Any,
            .commonIdentifierDescription: metadata.description,
            .iTunesMetadataContentRating: metadata.rating,
            .quickTimeMetadataGenre: metadata.genre,
            .iTunesMetadataCopyright: metadata.copyright
        ]
        return mapping.compactMap { createMetadataItem(for:$0, value:$1) }
    }

    private func createMetadataItem(for identifier: AVMetadataIdentifier,
                                    value: Any) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = identifier
        item.value = value as? NSCopying & NSObjectProtocol
        // Specify "und" to indicate an undefined language.
        item.extendedLanguageTag = "und"
        return item.copy() as! AVMetadataItem
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
