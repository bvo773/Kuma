//
//  ContentView.swift
//  Kuma
//
//  Created by spaceduck on 1/25/25.
//  Library: SF Symbols 6

import SwiftUI

struct ContentView: View {
    @State private var timeRemaining = 1500 // 25 minutes in seconds
    @State private var timerRunning = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(timeString(secondsRemaining: timeRemaining))
                .font(.system(size: 60))
                .padding()
            
            HStack(spacing: 40) {
                Button(action: {
                    // Start/Pause logic
                }) {
                    //ternary operator: if-else | if timer running is true, display pause | otherweise display play
                    Image(systemName: timerRunning ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                
                Button(action: {
                    // Reset logic
                }) {
                    Image(systemName: "stop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
        }
       
    }
    
    func timeString(secondsRemaining: Int) -> String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}

#Preview {
    ContentView()
}
