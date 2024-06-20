//
//  RegisterView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 20/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {
            Image(.firebaseLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .padding(.vertical, 30)
            
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "johndoe@protonmail.com")
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .keyboardType(.emailAddress)
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "John Doe")
                .autocorrectionDisabled(true)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
