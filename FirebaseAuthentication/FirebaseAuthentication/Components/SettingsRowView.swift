//
//  SettingsRowView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 21/06/2024.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let titleColor: Color?
    let tintColor: Color
    let text: String?
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(titleColor ?? .primary)
            
            Spacer()
            
            Text(text ?? "")
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear",
                    title: "Version",
                    titleColor: nil,
                    tintColor: Color(.systemGray),
                    text: "1.0.0")
}
