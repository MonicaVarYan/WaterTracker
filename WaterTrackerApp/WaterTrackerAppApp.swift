//
//  WaterTrackerAppApp.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-11-21.
//

import SwiftUI

@main
struct WaterTrackerAppApp: App {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
