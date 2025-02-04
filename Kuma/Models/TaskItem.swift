//
//  TaskItem.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//

import Foundation
/// Represents a single task in the to do list
struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
