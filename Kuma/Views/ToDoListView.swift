//
//  ToDoListView.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//


import SwiftUI

struct ToDoListView: View {
    @Binding var tasks: [TaskItem]
    @Binding var newTaskTitle: String
    var addTask: () -> Void
    var body: some View {
        VStack {
            Text("To-Do-List")
                .font(.system(size: 24, weight: .bold, design: .default))
            
            // Input field for adding new tasks
            HStack {
                TextField("Add a new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTask) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                .disabled(newTaskTitle.isEmpty)
            }
            
            // List of tasks with checkboxes
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Button(action: {task.isCompleted.toggle()}, label: {
                            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                        })
                    }
                    
                }
            }
        }.padding()
    }
}
