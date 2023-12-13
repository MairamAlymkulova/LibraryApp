//
//  DatabaseService.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import Foundation
import FirebaseFirestore

class DatabaseService{
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var userRef: CollectionReference{
        return db.collection("users")
    }
    
    private init() {    }
    func setUser(user: Usser, completion: @escaping (Result<Usser, Error>) ->()) {
        
        userRef.document(user.id).setData(user.representation) {error in
            if let error = error{
                completion(.failure(error))
                
            }else{
                completion(.success(user))
            }
        }
    }
    
    func getUser(completion: @escaping (Result<Usser, Error>) -> ()){
        if let user = FirebaseService.shared.getCurrentUser(){
            userRef.document(user.uid).getDocument { docSnapshot, error in
                guard let snapshot = docSnapshot else{
                    return
                }
                guard let data = snapshot.data() else{
                    return
                }
                guard let id = data["id"] as? String else {return}
                guard let userName = data["name"] as? String else {return}
                guard let thername = data["thirname"] as? String else {return}
                guard let password = data["password"] as? String else {return}
                
                let user = Usser(id:id, name: userName, thirname: thername, password: password)

            }
        }
    }
}
