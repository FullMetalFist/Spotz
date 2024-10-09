//
//  Profile.swift
//  Spotz
//
//  Created by Michael Vilabrera on 10/9/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification = true
    var seasonalEmoji = Season.spring
    var goalDate = Date()
    
    static let `default` = Profile(username: "harold_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "❄️"
        
        var id: String { rawValue }
    }
}
