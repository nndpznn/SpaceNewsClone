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
        position = CGPoint(x: Double.random(in: 0...width), y: Double.random(in: 50...height))

        // Randomize animation duration and delay to make each star's animation unique
        animationDuration = Double.random(in: 10...50)
        delay = Double.random(in: 0...10)
    }

    var body: some View {
        let lowerBound = 0.1 //makes the random number for each particular star, opacity and size share the same value
        let upperBound = 1.0 //which makes the illusion of closer and farther away stars, because the ones that are smaller
        let randomDouble = Double.random(in: lowerBound..<upperBound) //will have less opacity.
        Circle()
            .fill(Color.white)
            .frame(width: randomDouble*3, height: randomDouble*3)
            .position(position)
            .opacity(randomDouble) // Start fully transparent
            .animation(Animation.easeInOut(duration: animationDuration).delay(delay).repeatForever(autoreverses: true), value: position)
//            .onAppear {
//                // Trigger the opacity change
//            }
    }
}


