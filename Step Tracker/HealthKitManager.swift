//
//  HealthKitManager.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 14.12.24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager{
    
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
