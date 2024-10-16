//
//  ContentView.swift
//  MacSpotz
//
//  Created by Michael Vilabrera on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SpotList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
