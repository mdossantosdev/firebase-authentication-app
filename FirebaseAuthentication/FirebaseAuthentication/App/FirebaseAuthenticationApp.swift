//
//  FirebaseAuthenticationApp.swift
//  FirebaseAuthentication
//
//  Created by Marc on 17/06/2024.
//

import SwiftUI

@main
struct FirebaseAuthenticationApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
