//
//  HealthDataListView.swift
//  Step Tracker
//
//  Created by Moritz Plingen on 10.12.24.
//

import SwiftUI

struct HealthDataListView: View {
    var metric: HealthMetricContext
    @State private var isShowingAddData: Bool = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd : String = ""
    
    var body: some View {
        List(0..<28) { i in
            HStack{
                Text(Date(), format: .dateTime.year().month().day())
                Spacer()
                Text(1000, format: .number)
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar{
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    
    var addDataView: some View {
        NavigationStack{
            Form {
                DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
                HStack{
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data"){
                        // Do code later
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss"){
                        isShowingAddData = false
                    }
                }
            }
        }
    }
    
}

#Preview {
    NavigationStack{
        HealthDataListView(metric: .weight)
    }
}
