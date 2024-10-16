//
//  SpotDetail.swift
//  MacSpotz
//
//  Created by Michael Vilabrera on 10/15/24.
//

import SwiftUI
import MapKit

struct SpotDetail: View {
    @Environment(ModelData.self) var modelData
    var spot: Spot
    
    var spotIndex: Int {
        modelData.spotz.firstIndex(where: { $0.id == spot.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: spot.locationCoordinate)
                    .frame(height: 300)
                Button(action: {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: spot.locationCoordinate))
                    destination.name = spot.name
                    destination.openInMaps()
                }, label: {
                    Text("Open In Maps")
                })
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20.0) {
                HStack(spacing: 24) {
                    CircleImage(image: spot.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(spot.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.spotz[spotIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(spot.park)
                            Text(spot.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                
                Divider()
                Text("About \(spot.name)")
                Text(spot.description)
                
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(spot.name)
    }
}

#Preview {
    let modelData = ModelData()
    return SpotDetail(spot: modelData.spotz[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
