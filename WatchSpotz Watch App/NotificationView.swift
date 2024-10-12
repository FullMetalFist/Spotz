//
//  NotificationView.swift
//  WatchSpotz Watch App
//
//  Created by Michael Vilabrera on 10/11/24.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var spot: Spot?
    
    var body: some View {
        ScrollView {
            VStack {
                if let spot {
                    CircleImage(image: spot.image.resizable())
                        .scaledToFit()
                }
                Text(title ?? "Unknown Spot")
                    .font(.headline)
                Divider()
                Text(message ?? "You are within 5 miles of your favorite Spot")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    NotificationView(title: "Charybdis Playground", message: "You are near Charybdis Playground", spot: ModelData().spotz[10])
}
