//
//  BookListAdmin.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct BooksListAdmin: View {
    @State var showBookInfo: Bool = false
    @State var addBook: Bool = false
    @State var image = UIImage()
    @Binding var bookName: String?
    @Binding var writer: String?
    @Binding var library: String?
    @State var currentBook: Book?
    @State var books: [Book] = [Book]()
    var body: some View {

        if showBookInfo{
            BookInfoAdmin(show: $showBookInfo, book: $currentBook)
        }
        else if addBook{
            AddBookView(addBook: $addBook)
        }
        else{
            
            VStack{
                HStack{
                    Spacer()
                    
                    Button(action: {
                        addBook.toggle()
                    }, label: {
                        Text("add book")
                        Image(systemName: "plus.app")
                            .font(.system(size: 30))
                    })
                    .foregroundColor(.black)
                    
                }
                .padding()
                List {
                    if books.count == 0 {
                        Text("No books found")
                    }else{
                        ForEach(books, id: \.id){book in
                            ListOfBook(img: book.img, bookName: book.bookName, writerName: book.author)
                            
                                .onTapGesture {
                                    currentBook = book
                                    withAnimation (.snappy) {
                                        showBookInfo.toggle()
                                        
                                    }
                                }

                        }
                        
                    }
                    
                }

                .listStyle(PlainListStyle())
//                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            .onAppear(){
                
                DatabaseService.shared.getBook(bookName: bookName, writer: writer, library: library, completion: { result in
                    switch result{
                    case .success(let books):
                        self.books = books
                        print(bookName)
                        print("succes")
                    case .failure(_):
                        print("failure")
                        
                    }
                    
                })
            }

        }
            
    }
}

