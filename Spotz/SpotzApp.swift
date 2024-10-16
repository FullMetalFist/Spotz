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
        #if !os(watchOS)
        .commands {
            SpotCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "SpotzNear")
        #endif
        
        #if os(macOS)
        Settings {
            SpotSettings()
        }
        #endif
    }
}
