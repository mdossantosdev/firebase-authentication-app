//
//  SplashView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 30/06/2024.
//

import SwiftUI

struct SplashView: View {
    @Binding var isPresented: Bool

    @State private var scale = 0.0
    @State private var opacity = 0.0

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                Image(.firebaseLogo)
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
                    .frame(width: size.width / 2)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.interactiveSpring(
                            response: 1,
                            dampingFraction: 0.4,
                            blendDuration: 1.5
                        )) {
                            opacity = 1.0
                            scale = 1.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(.easeIn(duration: 0.35)) {
                                scale = 50
                                opacity = 0.0
                            }
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                            withAnimation(.easeIn(duration: 0.2)) {
                                self.isPresented.toggle()
                            }
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    SplashView(isPresented: .constant(true))
}
