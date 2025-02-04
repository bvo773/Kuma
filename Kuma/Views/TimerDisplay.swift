//
//  TimeDisplay.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//

import Foundation
import SwiftUI
/// Displays the remaining time

struct TimerDisplay: View {
    let timeRemaining: Int
    
    var body: some View {
        Text(TimeHelper.timeString(timeRemaining: timeRemaining))
            .font(.system(size: 60, weight: .bold, design: .monospaced))
            .padding()
            .accessibilityLabel("Time Remaining: \(TimeHelper.timeString(timeRemaining: timeRemaining))")
    }
}

