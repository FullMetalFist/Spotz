//
//  CategoryHome.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/8/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = true
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.visits.map { VisitedCard(spot: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environment(modelData)
            })
        } detail: {
            Text("Select a Spot")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
