import SwiftUI
import AVKit

class ForestVideoPlayer {
    static let shared = ForestVideoPlayer()
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Field", ofType: "mp4") ?? "Field"))
}

struct Forest: View {
    var body: some View {
        VideoPlayer(player: ForestVideoPlayer.shared.player)
            .onDisappear {
                ForestVideoPlayer.shared.player.pause()
            }
    }
}

struct Forest_Previews: PreviewProvider {
    static var previews: some View {
        Forest()
    }
}
