//
//  PlayPauseButton.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//

import SwiftUI

/// Play/Pause button view
struct PlayPauseButton: View {
    let timerRunning: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: timerRunning ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .accessibilityLabel(timerRunning ? "Pause Timer" : "Start Timer")
        }
    }
}
