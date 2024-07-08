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
    
    let db = Firestore.firestore()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await db.collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    func delete() async throws {
        do {
            guard let user = Auth.auth().currentUser else { return }
            guard let uid = Auth.auth().currentUser?.uid else { return }

            try await user.delete()
            try await db.collection("users").document(uid).delete()
            
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to delete user with error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try? await db.collection("users").document(uid).getDocument()
        guard let user = try? snapshot?.data(as: User.self) else { return }
        self.currentUser = user
    }
}
