//
//  ProfileView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 21/06/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack(spacing: 12) {
                    Text("JD")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray2))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("John Doe")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("johndoe@protonmail.com")
                            .font(.footnote)
                            .tint(.gray)
                    }
                }
            }
            
            Section("General") {
                SettingsRowView(imageName: "gear",
                                title: "Version",
                                titleColor: .black,
                                tintColor: .gray,
                                text: "1.0.0")
            }
        }
    }
}

#Preview {
    ProfileView()
}
