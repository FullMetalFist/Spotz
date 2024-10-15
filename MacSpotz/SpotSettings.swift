//
//  SpotSettings.swift
//  MacSpotz
//
//  Created by Michael Vilabrera on 10/15/24.
//

import SwiftUI

struct SpotSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .near
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Spotz Settings")
        .padding(80)
    }
}

#Preview {
    SpotSettings()
}
