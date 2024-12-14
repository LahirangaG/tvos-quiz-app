import SwiftUI

struct SplashView: View {
    @State private var navigateToMain = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("splash") // Use the image named "splash.jpeg" (without the extension)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Ensures the image covers the entire screen

                VStack {
                

                    // Navigate to ContentView after splash screen
                    NavigationLink(destination: ContentView(), isActive: $navigateToMain) {
                        EmptyView() // Empty view for automatic navigation
                    }
                }
                .onAppear {
                    // Delay for 2 seconds and then navigate to ContentView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        navigateToMain = true
                    }
                }
            }
        }
    }
}
