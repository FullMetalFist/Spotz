//
//  SpotDetail.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
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
            MapView(coordinate: spot.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: spot.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(spot.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.spotz[spotIndex].isFavorite)
                }
                HStack {
                    Text(spot.park)
                        
                    Spacer()
                    Text(spot.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About \(spot.name)")
                Text(spot.description)
            }
            .padding()
        }
        .navigationTitle(spot.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return SpotDetail(spot: modelData.spotz[0])
        .environment(modelData)
}
