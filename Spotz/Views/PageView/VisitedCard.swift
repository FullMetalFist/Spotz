//
//  VisitedCard.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/9/24.
//

import SwiftUI

struct VisitedCard: View {
    var spot: Spot
    
    var body: some View {
        spot.visitedImage?.resizable()
            .overlay {
                TextOverlay(spot: spot)
            }
    }
}

struct TextOverlay: View {
    var spot: Spot
    
    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            gradient
            VStack(alignment: .leading, content: {
                Text(spot.name)
                    .font(.title)
                    .bold()
                Text(spot.park)
            })
            .padding()
        })
        .foregroundStyle(.white)
    }
}

#Preview {
    VisitedCard(spot: ModelData().visits[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
