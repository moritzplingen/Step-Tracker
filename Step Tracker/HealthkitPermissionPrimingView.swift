//
//  HealthkitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 11.12.24.
//

import Charts
import HealthKitUI
import SwiftUI

struct HealthKitPermissionPrimingView: View {

    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) private var dismiss
    @State private var showHealthKitPermissionAlert: Bool = false
    @Binding var hasSeen: Bool

    var description: String = """
        This app displays your step and weight data in interactive charts. 

        You can also add new step or weight data to Apple Health from this app. Your data is private and secured.
        """

    var body: some View {
        VStack {
            Image(.healthKit)
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(radius: 2)
                .padding()
            Text("Apple Health Integration")
                .font(.title2).bold().padding()
            Text(description)
                .foregroundStyle(.secondary)
            Spacer()
            Button(
                action: {
                    showHealthKitPermissionAlert = true
                },
                label: {
                    Text("Sync Data to Apple Health")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                }
            )
            .buttonStyle(.borderedProminent).buttonBorderShape(.capsule).tint(
                .pink
            )
            .padding(.bottom)
        }
        .padding(.horizontal, 30)
        .interactiveDismissDisabled()
        .onAppear {
            hasSeen = true
        }
        .onAppear { hasSeen = true }
        .healthDataAccessRequest(
            store: hkManager.store,
            shareTypes: hkManager.types,
            readTypes: hkManager.types,
            trigger: showHealthKitPermissionAlert
        ) { result in
            switch result {
            case .success(_):
                dismiss()
            case .failure(_):
                // handle the error later
                dismiss()
            }
        }
    }
}

#Preview {
    HealthKitPermissionPrimingView(hasSeen: .constant(true))
        .environment(HealthKitManager())
}
