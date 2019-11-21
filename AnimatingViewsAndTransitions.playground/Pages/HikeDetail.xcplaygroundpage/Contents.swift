
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing the details for a hike.
 
 Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
 */

import SwiftUI
import PlaygroundSupport

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace),
    ]
    
    var body: some View {
        return VStack {
            Spacer()
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200, alignment: .center)
            Spacer()
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button(action: {
                        self.dataToShow = value.1
                    }) {
                        Text(verbatim: value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow
                                ? Color.gray
                                : Color.accentColor)
                            .animation(nil)
                    }
                }
            }
            Spacer()
        }
    }
}

// Before "Run My Code", turn off "Enable Results" (in the popup that opens by pressing the Gauge symbol next to "Run My Code").
let host = UIHostingController(rootView: HikeDetail(hike: hikeData[0]))
PlaygroundPage.current.liveView = host
