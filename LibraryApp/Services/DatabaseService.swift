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
    private var booksRef: CollectionReference{
        return db.collection("books")
    }
    
    private init() {    }
    
    func getBook(bookName: String? = nil, writer: String? = nil, library: String? = nil, completion: @escaping (Result<[Book], Error>) ->()){
        self.booksRef.getDocuments { qSnap, error in
            if let qSnap = qSnap{
                var books = [Book]()
                for doc in qSnap.documents{
                    guard let book = Book(doc: doc) else {return}
                    if let bookName{
                        if let library{
                            if book.bookName == bookName, book.library == library{
                                books.append(book)
                            }
                        }else {
                            if book.bookName == bookName{
                                books.append(book)
                            }
                        }
                    }
                    else if let writer{
                        if let library{
                            if book.author == writer, book.library == library{
                                books.append(book)
                            }
                        }else {
                            if book.author == writer{
                                books.append(book)
                            }
                        }
                    }
                    else{
                        books.append(book)
                    }
                    
                }
                completion(.success(books))
            }
            else if let error{
                completion(.failure(error))

            }
        }
    }
    
    
        
    func setBook(book: Book, image: Data? = nil, completion: @escaping (Result<Book, Error>) ->()) {
        guard let img = image else {
            self.booksRef.document(book.id).setData(book.representation) { error in
                if let error = error {
                    // Error occurred while updating book data.
                    completion(.failure(error))
                } else {
                    // Book data updated successfully.
                    completion(.success(book))
                }
            }
            return
        }
        StorageService.shared.upload(id: book.id, image: img) { result in
            switch result {
            case .success(let uploadedImageURL):
                // Image upload was successful. You can use 'uploadedImageURL' if needed.
                // Now, update the book data in Firestore.
                self.booksRef.document(book.id).setData(book.representation) { error in
                    if let error = error {
                        // Error occurred while updating book data.
                        completion(.failure(error))
                    } else {
                        // Book data updated successfully.
                        completion(.success(book))
                    }
                }
            case .failure(let uploadError):
                // Image upload failed.
                completion(.failure(uploadError))
            }
        }
        
    }

    
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
