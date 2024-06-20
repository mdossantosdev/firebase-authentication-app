//
//  LoginView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 19/06/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(.firebaseLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding(.vertical, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
