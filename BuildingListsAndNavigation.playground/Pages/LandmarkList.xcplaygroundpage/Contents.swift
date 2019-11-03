/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI
import PlaygroundSupport

// A single row to be displayed in a list of landmarks.
struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: landmark.name)
            Spacer()
        }
    }
}

// A view showing a list of landmarks.
struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

let host = UIHostingController(rootView: LandmarkList())
PlaygroundPage.current.liveView = host
