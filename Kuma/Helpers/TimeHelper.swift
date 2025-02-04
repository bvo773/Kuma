//
//  TimeHelper.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//

import Foundation

struct TimeHelper {
    static func timeString(timeRemaining: Int) -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
