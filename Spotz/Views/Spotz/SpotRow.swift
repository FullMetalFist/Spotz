//
//  SpotRow.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import SwiftUI

struct SpotRow: View {
    var spot: Spot
    
    var body: some View {
        HStack {
            spot.image
                .resizable()
                .frame(width: 50,height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(spot.name)
                    .bold()
                #if !os(watchOS)
                Text(spot.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }
            
            Spacer()
            
            if spot.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let spotz = ModelData().spotz
    return Group {
        SpotRow(spot: spotz[0])
        SpotRow(spot: spotz[1])
    }
}
