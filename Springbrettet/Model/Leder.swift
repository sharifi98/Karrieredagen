//
//  Leder.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 18/08/2023.
//

import Foundation
import SwiftUI

struct Leder: Hashable, Codable, Identifiable {
    var id: Int
    var role: String
    var name: String
    var email: String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
}
