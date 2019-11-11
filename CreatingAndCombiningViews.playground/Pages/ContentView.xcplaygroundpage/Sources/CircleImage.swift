
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that clips an image to a circle and adds a stroke and shadow.
 */

import UIKit
import SwiftUI

public struct CircleImage: View {
    
    public init() {}
    
    public var body: some View {
        Image(uiImage: #imageLiteral(resourceName: "turtlerock.JPG"))
            .clipShape(Circle())
    }
}

