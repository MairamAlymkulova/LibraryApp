//
//  BooksListUser.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct BooksListUser: View {
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
            BookInfo(show: $showBookInfo, book: $currentBook)
        }
        else{
            
            VStack{
                
                List {
                    if books.count == 0 {
                        Text("No books found")
                    }else if writer == nil,  bookName == nil,  library == nil {
                        ForEach(books, id: \.id){book in

                            ListOfBook(img: book.img, bookName: book.bookName, writerName: book.author)
                                .onTapGesture {
                                    currentBook = book
                                    withAnimation (.snappy) {
                                        showBookInfo.toggle()
                                        
                                    }
                                }

                        }
                    }else{
                        HStack(alignment: .top, spacing: 10){
                            Image(books[0].img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading, spacing: 10){
                                Text(books[0].bookName)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                Text(books[0].author)
                                    .font(.system(size: 20))
                                
                            }
                        }
                        .padding(.horizontal, 5)
                        ForEach(books, id: \.id){book in
                            Text(book.library)
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

//#Preview {
//    BooksListUser()
//}
