import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            VStack {
                Image("Mindrops")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .opacity(showSplash ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showSplash = false
                    }
                }
            }
            
            if !showSplash {
                Forest()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            ForestVideoPlayer.shared.player.play()
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
