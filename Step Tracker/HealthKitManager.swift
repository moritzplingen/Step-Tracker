//
//  HealthKitManager.swift
//  Step Tracker
//
//  Created by Sean Allen on 4/19/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {

    let store = HKHealthStore()

    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
