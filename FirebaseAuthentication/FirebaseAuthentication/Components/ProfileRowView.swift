//
//  ProfileRowView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 22/07/2024.
//

import SwiftUI

struct ProfileRowView: View {
    let title: String
    let titleColor: Color
    let text: String?
    
    var body: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(titleColor)
            
            Spacer()
            
            Text(text ?? "")
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    ProfileRowView(title: "Full Name", titleColor: .primary, text: "John Doe")
}
