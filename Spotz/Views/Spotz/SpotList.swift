//
//  SpotList.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import SwiftUI

struct SpotList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedSpot: Spot?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case biking = "Biking"
        case field = "Field"
        case historical = "Historical"
        case playground = "Playground"
        case ponds = "Ponds"
        
        var id: FilterCategory { self }
    }
    
    var filteredSpotz: [Spot] { modelData.spotz.filter {
        spot in
        (!showFavoritesOnly || spot.isFavorite) && (filter == .all || filter.rawValue == spot.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Spotz" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.spotz.firstIndex(where: { $0.id == selectedSpot?.id })
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            List(selection: $selectedSpot) {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredSpotz) {spot in
                    NavigationLink {
                        SpotDetail(spot: spot)
                    } label: {
                        SpotRow(spot: spot)
                    }
                    .tag(spot)
                }
            }
            .animation(.default, value: filteredSpotz)
            .navigationTitle("Spotz")
            .frame(minWidth: 300)
            .toolbar(content: {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) {
                                    category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        Toggle(isOn: $showFavoritesOnly, label: {
                                Label("Favorites only", systemImage: "star.fill")
                            })
                            
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
                })
        } detail: {
            Text("Select a Spot")
        }
        .focusedValue(\.selectedSpot, $modelData.spotz[index ?? 0])
    }
}

#Preview {
    SpotList()
        .environment(ModelData())
}
