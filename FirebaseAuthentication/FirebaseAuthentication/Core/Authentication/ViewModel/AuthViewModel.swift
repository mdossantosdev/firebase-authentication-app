//
//  AuthViewModel.swift
//  FirebaseAuthentication
//
//  Created by Marc on 23/06/2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {}
    
    func register(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            
            try await Firestore.firestore().collection("user").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}
