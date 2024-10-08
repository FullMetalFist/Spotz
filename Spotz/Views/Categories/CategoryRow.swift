//
//  CategoryRow.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/8/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Spot]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { spot in
                        NavigationLink {
                            SpotDetail(spot: spot)
                        } label: {
                            CategoryItem(spot: spot)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let spotz = ModelData().spotz
    return CategoryRow(categoryName: spotz[0].category.rawValue, items: Array(spotz.prefix(4)))
}
