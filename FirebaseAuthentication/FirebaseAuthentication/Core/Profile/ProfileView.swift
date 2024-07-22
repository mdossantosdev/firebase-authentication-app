//
//  ProfileView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 21/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack(spacing: 12) {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray2))
                            .clipShape(Circle())
                    }
                }
                
                Section("Account") {
                    ProfileRowView(title: "Full Name",
                                   titleColor: .primary,
                                   text: user.fullname)
                    
                    ProfileRowView(title: "Email",
                                   titleColor: .primary,
                                   text: user.email)
                    
                    ProfileRowView(title: "Password",
                                   titleColor: .primary,
                                   text: "•••••••••••")
                }
                
                Section {
                    Button {
                        viewModel.logout()
                    } label: {
                        ProfileRowView(title: "Logout",
                                       titleColor: Color(.systemRed),
                                       text: nil)
                    }
                    
                    Button(role: .destructive) {
                        Task {
                            try await viewModel.delete()
                        }
                    } label: {
                        ProfileRowView(title: "Delete Account",
                                       titleColor: Color(.systemRed),
                                       text: nil)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
