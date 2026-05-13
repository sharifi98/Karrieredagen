//
//  ColorsAndFonts.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 06/09/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let Orange = Color(hex: "E87D2B")
    static let kdBackground = Color(hex: "0E1E2B")
    static let kdText = Color.white
    static let kdSecondary = Color(hex: "8C939A")
    static let kdOrange = Color("KDOrange")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Font {
    static func kdHeading(_ size: CGFloat) -> Font {
        Font.custom("AvenirNext-Bold", size: size)
    }

    static func kdBody(_ size: CGFloat) -> Font {
        Font.custom("AvenirNext-Regular", size: size)
    }

    static func kdBodyMedium(_ size: CGFloat) -> Font {
        Font.custom("AvenirNext-Medium", size: size)
    }
}

extension CGFloat {
    // Corner radius scale
    static let radiusXSmall: CGFloat = 8
    static let radiusSmall: CGFloat = 10
    static let radiusMedium: CGFloat = 15
    static let radiusLarge: CGFloat = 20

    // Spacing scale
    static let spacingSmall: CGFloat = 8
    static let spacingBase: CGFloat = 10
    static let spacingMedium: CGFloat = 20
    static let spacingLarge: CGFloat = 30

    // Common sizes
    static let sizeAvatar: CGFloat = 50
}
