//
//  MapView.swift
//  Karriaredagen
//
//  Created by Hossein Sharifi on 30/05/2023.
//

import SwiftUI
import MapKit

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let color: Color
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotations = [MapAnnotationItem]()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapMarker(coordinate: annotation.coordinate, tint: annotation.color)
        }
        .onAppear {
            setRegionAndMarker(coordinate)
        }
    }
    
    private func setRegionAndMarker(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        annotations.append(MapAnnotationItem(coordinate: coordinate, color: Color(.red)))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
