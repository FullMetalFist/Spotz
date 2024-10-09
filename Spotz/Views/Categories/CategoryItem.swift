//
//  CategoryItem.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/8/24.
//

import SwiftUI

struct CategoryItem: View {
    var spot: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            spot.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(spot.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(spot: ModelData().spotz[2])
}
