//
//  ContentView.swift
//  Kuma
//
//  Created by spaceduck on 1/25/25.
//  Library: SF Symbols 6

import SwiftUI
import Combine

struct ContentView: View {
    @State private var timeRemaining = 1500 // 25 minutes in seconds
    @State private var timerRunning = false
    @State private var timerSubscription: AnyCancellable? // Manages the timer subscription, start and cancel as needed
    @State private var showAlert = false // Controls the display of the completion alert
    
    var body: some View {
        VStack(spacing: 20) {
            Text(timeString(secondsRemaining: timeRemaining))
                .font(.system(size: 60))
                .padding()
            
            HStack(spacing: 40) {
                Button(action: {
                    // Start/Pause logic
                    toggleTimer()
                }) {
                    //ternary operator: if-else | if timer running is true, display pause | otherweise display play
                    Image(systemName: timerRunning ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                
                Button(action: {
                    // Reset logic
                    resetTimer()
                }) {
                    Image(systemName: "stop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Time's up"),
                message: Text("Great job! Time for a short break"),
                dismissButton: .default(Text("OK")) {
                    resetTimer()
                }
            )
        }
       
    }
    
    
    func timeString(secondsRemaining: Int) -> String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    // Resume or starts the timer
    func toggleTimer() {
        if timerRunning {
            pauseTimer()
        } else {
            startTimer()
        }
    }
    
    // Start the timer
    func startTimer() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.timerSubscription?.cancel()
                    self.timerRunning = false
                    self.showAlert = true
                }
                
            }
        timerRunning = true
    }
    
    
    // Pauses  the timer
    func pauseTimer() {
        timerSubscription?.cancel()
        timerRunning = false
    }
    
    // Resets the timer to the initial values based on session type
    func resetTimer() {
        pauseTimer()
        timeRemaining = 1500
    }
}

#Preview {
    ContentView()
}
