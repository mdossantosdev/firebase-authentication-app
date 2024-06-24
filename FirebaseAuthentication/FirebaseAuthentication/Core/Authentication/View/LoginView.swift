//
//  LoginView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 19/06/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
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
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                ButtonView(title: "SIGN IN", icon: "arrow.right") {
                    print("LOG IN")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                
                Spacer()
                
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.footnote)
                    .foregroundStyle(Color(.systemBlue))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
