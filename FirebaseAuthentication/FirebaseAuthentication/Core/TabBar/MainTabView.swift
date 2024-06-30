//
//  MainTabView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 29/06/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home Screen")
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)

                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        
                        Text("Profile")
                    }
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
        }
        .tint(Color(.systemBlue))
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
}
