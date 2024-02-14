import SwiftUI

struct StarView: View {
    private let animationDuration: Double
    private let delay: Double
    private let position: CGPoint

    init() {
        // Screen width and height
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height

        // Random position for each star
        position = CGPoint(x: Double.random(in: 0...width), y: Double.random(in: 0...height))

        // Randomize animation duration and delay to make each star's animation unique
        animationDuration = Double.random(in: 1...3)
        delay = Double.random(in: 0...2)
    }

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 2, height: 2)
            .position(position)
            .opacity(0.5) // Start fully transparent
            .animation(Animation.easeInOut(duration: animationDuration).delay(delay).repeatForever(autoreverses: true), value: position)
//            .onAppear {
//                // Trigger the opacity change
//            }
    }
}
