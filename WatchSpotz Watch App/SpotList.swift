//
//  SpotList.swift
//  WatchSpotz Watch App
//
//  Created by Michael Vilabrera on 10/15/24.
//

import SwiftUI

struct SpotList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredSpotz: [Spot] { modelData.spotz.filter {
        spot in
        (!showFavoritesOnly || spot.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredSpotz) {spot in
                    NavigationLink {
                        SpotDetail(spot: spot)
                    } label: {
                        SpotRow(spot: spot)
                    }
                }
                .animation(.default, value: filteredSpotz)
                .navigationTitle("Spotz")
            }
        } detail: {
            Text("Select a Spot")
        }
    }
}

#Preview {
    SpotList()
        .environment(ModelData())
}
