
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The elevation, heart rate, and pace of a hike plotted on a graph.
 */

import SwiftUI

public struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>
    
    public init(hike: Hike, path: KeyPath<Hike.Observation, Range<Double>>) {
        self.hike = hike
        self.path = path
    }
    
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    public var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: self.path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(data.indices) { index in
                    GraphCapsule(
                        index: index,
                        height: proxy.size.height,
                        range: data[index][keyPath: self.path],
                        overallRange: overallRange)
                        .colorMultiply(self.color)
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}
