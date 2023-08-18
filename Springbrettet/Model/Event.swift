//
//  Event.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import Foundation
import SwiftUI

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date: String
    var start_time: String
    var end_time: String
    var location: String
    var speakers: [String]?
    var companies: [String]?
    var duration: Int
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
