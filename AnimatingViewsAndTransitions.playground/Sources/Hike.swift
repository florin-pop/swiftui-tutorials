
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for a hike.
 */

import SwiftUI

public struct Hike: Codable, Hashable, Identifiable {
    public var name: String
    public var id: Int
    var distance: Double
    var difficulty: Int
    public var observations: [Observation]
    
    static var formatter = LengthFormatter()
    
    public var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    public struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        
        public var elevation: Range<Double>
        public var pace: Range<Double>
        public var heartRate: Range<Double>
    }
}
