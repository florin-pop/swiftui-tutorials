
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for an individual landmark.
 */

import SwiftUI
import CoreLocation

public struct Landmark: Hashable, Codable, Identifiable {
    public var id: Int
    public var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    public var state: String
    public var park: String
    var category: Category
    public var isFavorite: Bool
    
    public var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

public extension Landmark {
    public var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

public struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
