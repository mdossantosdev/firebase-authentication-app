//
//  InputView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 20/06/2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    
    let title: String
    let placeholder: String
    var isSecureField: Bool = false
    
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.subheadline)
                
            if isSecureField {
                ZStack {
                    if !showPassword {
                        SecureField(placeholder, text: $text)
                            .textFieldStyle(CustomTextField())
                    } else {
                        TextField(placeholder, text: $text)
                            .textFieldStyle(CustomTextField())
                    }
                }
                .overlay(alignment: .trailing) {
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                        .padding(10)
                        .onTapGesture { showPassword.toggle() }
                }
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(CustomTextField())
            }
        }
    }
}

struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .frame(height: 50)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "johndoe@protonmail.com")
}
