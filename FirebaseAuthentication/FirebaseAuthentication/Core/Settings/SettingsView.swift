//
//  SettingsView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 21/07/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("General") {
                    SettingsRowView(imageName: "gear",
                                    title: "App Version",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: "1.0.0")
                }
                
                Section("Device") {
                    SettingsRowView(imageName: "iphone",
                                    title: "Device Name",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.name)
                    
                    SettingsRowView(imageName: "cpu",
                                    title: "System Name",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.systemName)
                    
                    SettingsRowView(imageName: "number",
                                    title: "System Version",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.systemVersion)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
