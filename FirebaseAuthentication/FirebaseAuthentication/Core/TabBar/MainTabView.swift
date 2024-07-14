//
//  MainTabView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 29/06/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tag(Tab.home)
            
            Text("Favorite")
                .tag(Tab.favorite)
            
            ProfileView()
                .tag(Tab.profile)
            
            Text("Settings")
                .tag(Tab.settings)
        }
        .overlay(alignment: .bottom) {
            TabBarView(selectedTab: $selectedTab)
                .padding()
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthViewModel())
}
