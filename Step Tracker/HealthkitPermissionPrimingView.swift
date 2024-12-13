//
//  HealthkitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 11.12.24.
//

import SwiftUI

struct HealthkitPermissionPrimingView: View {
    
    private var description: String = """
This app displays your step and weight data in interactive charts. 

You can also add new step or weight data to Apple Health from this app. Your data is private and secured.
"""
    
    var body: some View {
        VStack {
            Image(.healthKit)
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(radius: 10)
                .padding()
            Text("Apple Health Integration")
                .font(.title2).bold().padding()
            Text(description)
                .foregroundStyle(.secondary)
            Spacer()
            Button("Connect Apple Health"){
                // HealthKit integration code to be done
            }
        }.padding(.horizontal,30)
    }
}

#Preview {
    HealthkitPermissionPrimingView()
}
