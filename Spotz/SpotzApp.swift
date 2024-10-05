//
//  SpotzApp.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/27/24.
//

import SwiftUI

@main
struct SpotzApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
