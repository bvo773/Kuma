//
//  StopButton.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//

import SwiftUI

struct StopButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "stop.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .accessibilityLabel("Reset Timer")
        }
    }
}
