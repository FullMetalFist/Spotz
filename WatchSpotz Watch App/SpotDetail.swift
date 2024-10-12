//
//  SpotDetail.swift
//  WatchSpotz Watch App
//
//  Created by Michael Vilabrera on 10/10/24.
//

import SwiftUI

struct SpotDetail: View {
    @Environment(ModelData.self) var modelData
    var spot: Spot
    
    var spotIndex: Int {
        modelData.spotz.firstIndex(where: { $0.id == spot.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                CircleImage(image: spot.image
                    .resizable())
                .scaledToFit()
                Text(spot.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $modelData.spotz[spotIndex].hasVisited) {
                    Text("Visited")
                }
                
                Divider()
                
                Text(spot.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                Text(spot.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: spot.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Spotz")
    }
}

#Preview {
    let modelData = ModelData()
    return SpotDetail(spot: modelData.spotz[0])
        .environment(modelData)
}
