//
//  Company.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import Foundation

struct Company: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var industry: String
    var description: String
    var isFavorite: Bool

    var imageName: String
    var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
