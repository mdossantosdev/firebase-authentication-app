//
//  AuthViewModel.swift
//  FirebaseAuthentication
//
//  Created by Marc on 23/06/2024.
//

import Firebase
import Foundation

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {}
}
