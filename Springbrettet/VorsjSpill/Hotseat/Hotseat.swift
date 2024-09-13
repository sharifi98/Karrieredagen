//
//  Hotseat.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 13/09/2024.
//

import SwiftUI

struct Hotseat: View {
    @State private var rotation: Double = 0
    @State private var isSpinning = false

    var body: some View {
        ZStack {
            BackgroundSB()

            VStack {

                Text("Hotseat")
                    .font(.title)
                    .foregroundStyle(.kdOrange)
                Spacer()

                ZStack {
                    // Group the wheel and logo together and apply rotation
                    ZStack {
                        Wheel()
                            .frame(width: 300, height: 300)
                        Image("SB")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    .rotationEffect(Angle(degrees: rotation))

                    // Arrow that spins with the wheel
                    Arrow()
                        .fill(Color.kdText)
                        .frame(width: 20, height: 100)
                        .offset(y: -150)
                        .rotationEffect(Angle(degrees: rotation))
                }
                .onTapGesture {
                    startSpinning()
                }

                Spacer()
            }
        }
        .navigationBarWithTransparentBackground()
    }

    // Function to handle the spinning animation
    func startSpinning() {
        guard !isSpinning else { return }
        isSpinning = true

        let randomExtraRotation = Double.random(in: 0...360)
        let totalRotation = 360 * 5 + randomExtraRotation // 5 full spins plus random offset
        let duration = 5.0 // Duration of the spin in seconds

        withAnimation(Animation.easeOut(duration: duration)) {
            rotation += totalRotation
        }

        // Reset the spinning state after the animation completes
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            isSpinning = false
            // Keep the rotation within 0 to 360 degrees
            rotation = rotation.truncatingRemainder(dividingBy: 360)
        }
    }
}

// Wheel view with colored segments
struct Wheel: View {
    let segments = 8 // Number of segments in the wheel
    let colors: [Color] = [
        Color.kdBackground,
        Color.kdSecondary.opacity(0.8),

    ]

    var body: some View {
        ZStack {
            ForEach(0..<segments, id: \.self) { index in
                Segment(
                    startAngle: Angle(degrees: Double(index) * (360.0 / Double(segments))),
                    endAngle: Angle(degrees: Double(index + 1) * (360.0 / Double(segments)))
                )
                .fill(colors[index % colors.count])
            }
        }
    }
}

// Segment shape for each part of the wheel
struct Segment: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(
            center: center,
            radius: rect.width / 2,
            startAngle: startAngle - Angle(degrees: 90),
            endAngle: endAngle - Angle(degrees: 90),
            clockwise: false
        )
        path.closeSubpath()

        return path
    }
}

// Arrow shape that spins with the wheel
struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let tip = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.midX - rect.width / 2, y: rect.maxY)
        let right = CGPoint(x: rect.midX + rect.width / 2, y: rect.maxY)

        path.move(to: tip)
        path.addLine(to: left)
        path.addLine(to: right)
        path.closeSubpath()

        return path
    }
}

// Preview
struct Hotseat_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Hotseat()
        }
    }
}
