/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that hosts an `MKMapView`.
 */

import SwiftUI
import MapKit

public struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    public func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
