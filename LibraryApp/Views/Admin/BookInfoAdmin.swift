//
//  BookInfoAdmin.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct BookInfoAdmin: View {
    @Binding var show: Bool
    @Binding var book: Book?
    @State private var isSaving: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        saveBook()

                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "arrowshape.backward.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                })
                .disabled(isSaving)
                Spacer()
                Button(action: {
                    withAnimation(.snappy) {
                        // Do something when the trash button is tapped
                    }
                }, label: {
                    Image(systemName: "trash")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                })
            }
            .padding()
            
            
            VStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("Book Name", text: Binding(
                    get: { book?.bookName ?? "" },
                    set: { book?.bookName = $0 }
                ))
                .font(.title)
                .padding()
                
                TextField("Author", text: Binding(
                    get: { book?.author ?? "" },
                    set: { book?.author = $0 }
                ))
                .font(.system(size: 20))
                .padding()
            }
            
            TextEditor(text: Binding(
                get: { book?.aboutBook ?? "" },
                set: { book?.aboutBook = $0 }
            ))
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        
    }
    private func saveBook() {
        isSaving = true
        if let book {
            DatabaseService.shared.setBook(book: book) { result in
                defer {
                    isSaving = false
                }
                switch result {
                case .success(let books):
                    // Update any relevant state or perform actions after successful save
                    print("Success")
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                }
            }
        }
    }
}
