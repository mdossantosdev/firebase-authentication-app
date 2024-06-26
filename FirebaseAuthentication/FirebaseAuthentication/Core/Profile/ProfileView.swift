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
                
                Section("General") {
                    SettingsRowView(imageName: "gear",
                                    title: "App Version",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: "1.0.0")
                }
                
                Section("Device") {
                    SettingsRowView(imageName: "iphone",
                                    title: "Device Name",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.name)
                    
                    SettingsRowView(imageName: "cpu",
                                    title: "System Name",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.systemName)
                    
                    SettingsRowView(imageName: "number",
                                    title: "System Version",
                                    titleColor: nil,
                                    tintColor: Color(.systemGray),
                                    text: UIDevice.current.systemVersion)
                }
                
                Section("Account") {
                    Button {
                        print("LOG OUT")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle",
                                        title: "Log Out",
                                        titleColor: nil,
                                        tintColor: .red,
                                        text: nil)
                    }
                    
                    Button {
                        print("DELETE")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle",
                                        title: "Delete Account",
                                        titleColor: .red,
                                        tintColor: .red,
                                        text: nil)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
