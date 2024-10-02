//
//  MapView.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 40.796597, longitude: -73.824886))
}
