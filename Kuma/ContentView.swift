//
//  ContentView.swift
//  Kuma
//
//  Created by spaceduck on 1/25/25.
//  Library: SF Symbols 6

import SwiftUI
import Combine
/*
 Represents an alert that can be shown in the app
    title: The main heading of the alert
    message: Additional information or context.
    buttonTitle: The label for the dismiss button.
    action: A closure to execute when the button is tapped.
 */


struct ContentView: View {
    let initialTime = 1500 // 25 minutes in seconds
    @State private var timeRemaining: Int = 1500
    @State private var timerRunning = false
    @State private var timerSubscription: AnyCancellable? // Manages the timer subscription, start and cancel as needed
    @State private var alertInfo: AlertInfo? = nil // Hold alerts information
    @State private var tasks: [TaskItem] = []
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TimerDisplay(timeRemaining: timeRemaining)

            HStack(spacing: 40) {
                PlayPauseButton(timerRunning: timerRunning, action: toggleTimer)
                StopButton(action: resetTimer)
            }
            
            Divider().padding(.vertical)
            
            ToDoListView(
                tasks: $tasks,
                newTaskTitle: $newTaskTitle,
                addTask: addTask
            )
            
        }
        .alert(item: $alertInfo) { info in
            Alert(
                title: Text(info.title) ,
                message: Text(info.message),
                dismissButton: .default(Text(info.buttonTitle), action:
                    info.action)
            )
        }
       
    }
    

    // Toggles the timer between running and pause states
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
                    self.showCompletionAlert()
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
        timeRemaining = initialTime
    }
    
    func showCompletionAlert() {
        alertInfo = AlertInfo(
            title: "Completed",
            message: "Your 25 minutes has ended", buttonTitle: "OK",
            action: {
                print("Alert OK button tapped")
            })
    }
    
    func addTask() {
        return
    }
}






#Preview {
    ContentView()
}
