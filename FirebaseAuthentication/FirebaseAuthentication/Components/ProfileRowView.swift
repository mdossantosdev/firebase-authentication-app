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
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(titleColor)
            
            Spacer()
            
            Text(text ?? "")
                .font(.callout)
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    ProfileRowView(title: "Full Name", titleColor: .primary, text: "John Doe")
}
