//
//  TabBarView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 14/07/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case favorite = "Favorite"
    case profile = "Profile"
    case settings = "Settings"

    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        case .settings:
            return "gearshape"
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.systemImage + ".fill"
    }
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    VStack {
                        Image(systemName: selectedTab == tab ? fillImage : tab.systemImage)
                            .font(.system(size: 20))
                            .padding(.bottom, 1)
                        
                        Text(tab.rawValue)
                            .font(.system(size: 16))
                    }
                    .foregroundStyle(selectedTab == tab ? Color(.firebaseOrange) : Color(.systemGray))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 70)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
}
