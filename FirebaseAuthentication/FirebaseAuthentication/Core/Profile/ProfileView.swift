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
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .tint(.gray)
                        }
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.logout()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle",
                                        title: "Log Out",
                                        titleColor: Color(.systemRed),
                                        tintColor: Color(.systemRed),
                                        text: nil)
                    }
                    
                    Button(role: .destructive) {
                        Task {
                            try await viewModel.delete()
                        }
                    } label: {
                        SettingsRowView(imageName: "xmark.circle",
                                        title: "Delete Account",
                                        titleColor: Color(.systemRed),
                                        tintColor: Color(.systemRed),
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
