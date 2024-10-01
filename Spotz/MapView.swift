//
//  MapView.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.796597, longitude: -73.824886), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    }
}

#Preview {
    MapView()
}
