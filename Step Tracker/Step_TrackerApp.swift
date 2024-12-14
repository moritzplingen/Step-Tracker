//
//  Step_TrackerApp.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 09.12.24.
//

import SwiftUI

@main
struct Step_TrackerApp: App {
    
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
