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
            NavigationStack {
                Text(user.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 100)
                    .background(Color(.systemGray2))
                    .clipShape(Circle())
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Edit")
                }
                
                List {
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
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
