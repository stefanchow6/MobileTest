//
//  ContentView.swift
//  MobileTest
//
//  Created by zhouzhenhua on 2025/1/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button("Refresh") {
                    queryBookingData()
                }
                NavigationLink("Leave") {
                    Text("Empty Page")
                        .navigationTitle("Empty Page")
                }
            }
            .navigationTitle("Demo Page")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                queryBookingData()
            }
        }
    }
    
    func queryBookingData() {
        Task {
            do {
                let data = try await BookingManager.shared.queryBookingData()
                print("queryBookingData: \(data.toJsonString)")
            } catch {
                print("queryBookingData error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
