//
//  Spot.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Spot: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var hasVisited: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case biking = "Biking"
        case field = "Field"
        case historical = "Historical"
        case playground = "Playground"
        case ponds = "Ponds"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
