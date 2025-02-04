//
//  AlertInfo.swift
//  Kuma
//
//  Created by spaceduck on 2/2/25.
//
import Foundation

/// Represents an alert that can be shown in the app
struct AlertInfo: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> Void
}
