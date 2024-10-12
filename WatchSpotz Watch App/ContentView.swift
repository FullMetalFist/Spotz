//
//  ContentView.swift
//  WatchSpotz Watch App
//
//  Created by Michael Vilabrera on 10/10/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        SpotList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(options: [.alert, .sound, .badge])
            }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
