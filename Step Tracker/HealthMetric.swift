//
//  HealthMetric.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 16.12.24.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
