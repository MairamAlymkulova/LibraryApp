//
//  FirebaseService.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import Firebase
import FirebaseAuth

class FirebaseService {
    static let shared = FirebaseService()

    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }

    func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
}
