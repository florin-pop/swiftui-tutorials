/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that clips an image to a circle and adds a stroke and shadow.
 */

import UIKit
import SwiftUI
import PlaygroundSupport

struct CircleImage: View {
    var body: some View {
        Image(uiImage:#imageLiteral(resourceName: "turtlerock.jpg") )
            .clipShape(Circle())
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

let host = UIHostingController(rootView: CircleImage())
PlaygroundPage.current.liveView = host
