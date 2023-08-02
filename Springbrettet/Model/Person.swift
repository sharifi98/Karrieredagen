//
//  Springbretter.swift
//  Springbrettet
//
//  Created by Hossein Sharifi on 01/08/2023.
//

import Foundation
import SwiftUI

struct Person: Hashable, Codable, Identifiable {
    var id: Int
    var role: String
    var name: String
    var email: String
    var studie: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}


