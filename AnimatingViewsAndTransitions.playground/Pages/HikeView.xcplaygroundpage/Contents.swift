
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view displaying inforamtion about a hike, including an elevation graph.
 
 Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
 */

import SwiftUI
import PlaygroundSupport

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(transition)
            }
            
            Spacer()
        }
    }
}

// Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
let host = UIHostingController(rootView: HikeView(hike: hikeData[0]))
PlaygroundPage.current.liveView = host
