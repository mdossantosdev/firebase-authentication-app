//
//  User.swift
//  FirebaseAuthentication
//
//  Created by Marc on 23/06/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, fullname: "John Doe", email: "johndoe@protonmail.com")
}
