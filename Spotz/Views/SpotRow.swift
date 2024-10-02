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
            spot.image.resizable()
                .frame(width: 50,height: 50)
            Text(spot.name)
            
            Spacer()
        }
    }
}

#Preview {
    Group {
        SpotRow(spot: spotz[0])
        SpotRow(spot: spotz[1])
    }
}
