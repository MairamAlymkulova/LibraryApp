//
//  Book.swift
//  LibraryApp
//
//  Created by A Mairam on 14/12/23.
//

import Foundation
import FirebaseFirestore

struct Book{
    var id: String = UUID().uuidString
    var bookName: String
    var author: String
    var aboutBook: String
    var library: String
    
    
    var representation: [String: Any]{
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["bookName"] = self.bookName
        repres["author"] = self.author
        repres["aboutBook"] = self.aboutBook
        repres["library"] = self.library
        return repres
    }
    
    init(bookName: String, author: String, aboutBook: String, library: String) {
        self.bookName = bookName
        self.author = author
        self.aboutBook = aboutBook
        self.library = library
    }
    
    init?(doc: QueryDocumentSnapshot){
        let data = doc.data()
        
        guard let id = data["id"] as? String else {return nil}
        guard let bookName = data["bookName"] as? String else {return nil}
        guard let author = data["author"] as? String else {return nil}
        guard let aboutBook = data["aboutBook"] as? String else {return nil}
        guard let library = data["library"] as? String else {return nil}
        
        self.id = id
        self.bookName = bookName
        self.author = author
        self.aboutBook = aboutBook
        self.library = library

    }
}
