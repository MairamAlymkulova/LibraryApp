//
//  StorageService.swift
//  LibraryApp
//
//  Created by A Mairam on 14/12/23.
//

import Foundation
import FirebaseStorage

class StorageService{
    static let shared = StorageService()
    private init(){}
    private let storage = Storage.storage().reference()
    private var productRef: StorageReference{
        storage.child("products")
    }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> ()){
        let metaData = StorageMetadata()
        metaData.contentType = "img/jpg"
        productRef.child(id).putData(image, metadata: metaData){metadata, error in
            guard let metadata = metadata else{
                if let error = error{
                    completion(.failure(error))
                }
                return
            }
            completion(.success("size \(metadata.size)"))
        }
    }
    
    func downloadImg(id: String, completion: @escaping (Result<Data, Error>) -> ()) {
        productRef.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                let unknownError = NSError(domain: "YourDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                completion(.failure(unknownError))
            }
        }
    }

}

