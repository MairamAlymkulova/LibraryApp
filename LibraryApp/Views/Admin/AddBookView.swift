//
//  AddBookView.swift
//  LibraryApp
//
//  Created by A Mairam on 14/12/23.
//
import SwiftUI

struct AddBookView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @Binding var addBook: Bool
    @State var bookName: String = ""
    @State var writer: String = ""
    @State var aboutBook: String = ""
    @State var libraryList: Bool = false
    @State var library: String = ""
    @State var libraries = ["Library №14", "Library №24", "City Library №10", "City Library №11", "City Library №12 named after I. Razzakov", "City Library №13 named after S. Orozbakov", "City Library №15 named after Togolok Moldo", "City Library №17", "City Library №18 named after J. Bokonbaev"]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Add book")
                    .font(.title)
                Spacer()
                Button(action: {
                    let book = Book(bookName: bookName, author: writer, aboutBook: aboutBook, library: library)
                    DatabaseService.shared.setBook(book: book) { result in
                        switch result {
                        case .success(let book):
                            print(book)
                        case .failure(let error):
                            print(error)
                        }
                    }
                    addBook.toggle()
                    print(addBook)
                }, label: {
                    Image(systemName: "plus.app")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                })
            }
            
            HStack {
                Button(action: {
                    isImagePickerPresented.toggle()
                }) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 5)
                    } else {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }

                VStack(alignment: .leading) {
                    VStack(spacing: 40) {
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

                    VStack {
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
                }
            }

            VStack(alignment: .leading) {
                // Use TextEditor for multiline text input
                TextEditor(text: $aboutBook)
                    .frame(minHeight: 100) // Set a minimum height
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    }
            }

            VStack(spacing: 40) {
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

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(addBook: .constant(true))
    }
}
