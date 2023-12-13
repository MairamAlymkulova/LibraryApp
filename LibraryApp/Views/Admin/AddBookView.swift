//
//  AddBookView.swift
//  LibraryApp
//
//  Created by A Mairam on 14/12/23.
//

import SwiftUI

struct AddBookView: View {
    @Binding var addBook: Bool
    @State var bookName: String = ""
    @State var writer: String = ""
    @State var aboutBook: String = ""
    @State  var libraryList: Bool = false
    @State var library: String = ""
    @State var libraries = ["lab1", "lab2", "lab3"]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Add book")
                    .font(.title)
                Spacer()
                Button(action: {
                    let book = Book(bookName: bookName, author: writer, aboutBook: aboutBook, library: library)
                    DatabaseService.shared.setBook(book: book) { result in
                        switch result{
                        case .success(let book):
                            print(book)
                        case .failure(let error):
                            print(error)
                        }
                    }
                    addBook.toggle()
                }, label: {
                    Image(systemName: "plus.app")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                })
                
            }
            VStack(spacing: 40){
                TextField("book name", text: $bookName)
                    .font(.subheadline)
                
            }
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                
                
            }
            .padding()
            
            VStack{
                TextField("writer name", text: $writer)
                    .font(.subheadline)
            }
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                
                
            }
            .padding()
            ScrollView {
                TextField("About book", text: $aboutBook)
                    .padding()
            }
            .overlay {
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                
                
            }
            VStack(spacing: 40){
                Text(library.isEmpty ? "Choose library" : library)
                    .font(.subheadline)
                
            }
            .onTapGesture {
                withAnimation(.snappy) {
                    libraryList.toggle()
                }
            }
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                
                
            }
            .padding()
            if libraryList {
                List(libraries, id: \.self) { libraryItem in
                    Text(libraryItem)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                library = libraryItem
                                libraryList.toggle()
                            }
                        }
                }
                .listStyle(PlainListStyle())
                .frame(height: libraryList ? 120 : 0, alignment: .trailing)
                .background(.white)
                .shadow(radius: 10)
            }
            
        }
        .padding()
        
    }
}

//#Preview {
//    AddBookView()
//}
