//
//  ProfileView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 21/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isShowingDialog = false
    
    private let url = URL(string: "https://i.pravatar.cc/300?img=14")
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack {
                LoadingImageView(url: url,
                                 initials: user.initials)
                .padding(.bottom, 10)
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Edit")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 35)
                        .background(Capsule().fill(Color.firebaseOrange))
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
                        
                        Button {
                            isShowingDialog = true
                        } label: {
                            ProfileRowView(title: "Delete Account",
                                           titleColor: Color(.systemRed),
                                           text: nil)
                        }
                        .confirmationDialog(
                            Text("Delete Account?"),
                            isPresented: $isShowingDialog
                        ) {
                            Button("Delete Account", role: .destructive) {
                                Task {
                                    try await viewModel.delete()
                                }
                            }
                        } message: {
                            Text("Are you sure?")
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
