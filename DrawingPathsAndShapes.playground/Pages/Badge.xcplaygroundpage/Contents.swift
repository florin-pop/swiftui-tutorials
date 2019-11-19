
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that displays a badge.
 
 Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
 
 */

import SwiftUI
import PlaygroundSupport

struct Badge: View {
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0)
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

// Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
let host = UIHostingController(rootView: Badge())
PlaygroundPage.current.liveView = host

