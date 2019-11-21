
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A single line in the graph.
 */

import SwiftUI

public struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    public init(index: Int, height: CGFloat, range: Range<Double>, overallRange: Range<Double>) {
        self.index = index
        self.height = height
        self.range = range
        self.overallRange = overallRange
    }
    
    public var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    public var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    public var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
    
    public var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
            .animation(animation)
    }
}
