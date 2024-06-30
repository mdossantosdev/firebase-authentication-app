//
//  ContentView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 17/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isSplashPresented = true

    var body: some View {
        Group {
            if !isSplashPresented {
                if viewModel.userSession != nil {
                    MainTabView()
                } else {
                    LoginView()
                }
            } else {
                SplashView(isPresented: $isSplashPresented)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
