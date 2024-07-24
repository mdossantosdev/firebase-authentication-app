//
//  LoadingImageView.swift
//  FirebaseAuthentication
//
//  Created by Marc on 23/07/2024.
//

import SwiftUI

struct LoadingImageView: View {
    let url: URL?
    let initials: String?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(.firebaseOrange, lineWidth: 4))
        } placeholder: {
            Text(initials ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 120, height: 120)
                .background(Color(.systemGray3))
                .clipShape(Circle())
        }
    }
}

#Preview {
    LoadingImageView(url: URL(string: "https://i.pravatar.cc/300?img=14"), initials: "JD")
}
