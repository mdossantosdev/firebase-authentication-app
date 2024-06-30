//
//  SplashView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 30/06/2024.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                Image(.firebaseLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width / 2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    SplashView()
}
