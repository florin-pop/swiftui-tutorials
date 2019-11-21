/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The elevation, heart rate, and pace of a hike plotted on a graph.
 
 Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
 */

import SwiftUI
import PlaygroundSupport

struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>
    
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
    
    var body: some View {
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

// Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
let host = UIHostingController(rootView: Group {
    HikeGraph(hike: hikeData[0], path: \.elevation)
        .frame(height: 150)
    Spacer()
    HikeGraph(hike: hikeData[0], path: \.heartRate)
        .frame(height: 150)
    Spacer()
    HikeGraph(hike: hikeData[0], path: \.pace)
        .frame(height: 150)
    Spacer()
})
PlaygroundPage.current.liveView = host

