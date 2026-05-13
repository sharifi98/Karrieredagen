//
//  Company+UI.swift
//  Springbrettet
//

import SwiftUI
import CoreLocation

extension Company {
    var image: Image {
        Image(imageName)
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
