//
//  SpotDetail.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import SwiftUI

struct SpotDetail: View {
    var spot: Spot
    
    var body: some View {
        ScrollView {
            MapView(coordinate: spot.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: spot.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(spot.name)
                    .font(.title)
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
    SpotDetail(spot: spotz[0])
}
