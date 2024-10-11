//
//  NotificationController.swift
//  WatchSpotz Watch App
//
//  Created by Michael Vilabrera on 10/11/24.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var spot: Spot?
    var title: String?
    var message: String?
    
    let spotIndexKey = "spotIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            spot: spot
        )
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[spotIndexKey] as? Int {
            spot = modelData.spotz[index]
        }
    }
}
