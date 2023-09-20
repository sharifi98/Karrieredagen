//
//  Company.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Company: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var industry: String
    var description: String
    var isFavorite: Bool
    
    
    private var imageName: String
        var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    
}
