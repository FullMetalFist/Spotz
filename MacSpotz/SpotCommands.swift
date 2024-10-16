//
//  SpotCommands.swift
//  MacSpotz
//
//  Created by Michael Vilabrera on 10/15/24.
//

import SwiftUI

struct SpotCommands: Commands {
    @FocusedBinding(\.selectedSpot) var selectedSpot
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Spot") {
            Button(action: {
                selectedSpot?.hasVisited.toggle()
            }, label: {
                Text("\(selectedSpot?.hasVisited == true ? "De-list" : "Mark") as Visited")
            })
            .keyboardShortcut("v", modifiers: [.shift, .option])
            .disabled(selectedSpot == nil)
        }
    }
}

private struct SelectedSpotKey: FocusedValueKey {
    typealias Value = Binding<Spot>
}

extension FocusedValues {
    var selectedSpot: Binding<Spot>? {
        get { self[SelectedSpotKey.self] }
        set { self[SelectedSpotKey.self] = newValue }
    }
}
