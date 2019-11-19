
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that displays a rotated version of a badge symbol.
 */

import SwiftUI

public struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    public init(angle: Angle) {
        self.angle = angle
    }
    
    public var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}
