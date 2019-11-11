
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that hosts an `MKMapView`.
 */

import SwiftUI
import MapKit

public struct MapView: UIViewRepresentable {
    public init() {}
    
    public func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    public func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

