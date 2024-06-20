//
//  ButtonView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 20/06/2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .foregroundStyle(.white)
            .background(Color(.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ButtonView(title: "SIGN IN", icon: "arrow.right", action: {})
}
