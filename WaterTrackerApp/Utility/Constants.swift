//
//  Constants.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-05.
//

import Foundation
import SwiftUI

// MARK: - DATE FORMATTER
let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("BlueP"), Color("BlueT")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
