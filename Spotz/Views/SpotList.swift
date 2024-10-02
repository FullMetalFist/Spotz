//
//  SpotList.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/1/24.
//

import SwiftUI

struct SpotList: View {
    var body: some View {
        NavigationSplitView {
            List(spotz) { spot in
                NavigationLink {
                    SpotDetail(spot: spot)
                } label: {
                    SpotRow(spot: spot)
                }
            }
            .navigationTitle("Spotz")
        } detail: {
            Text("Select a Spot")
        }
    }
}

#Preview {
    SpotList()
}
