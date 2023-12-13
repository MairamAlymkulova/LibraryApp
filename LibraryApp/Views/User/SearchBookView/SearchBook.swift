//
//  SearchBook.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct SearchBook: View {
//    @State var show: Bool = true
    @Binding var page: PageOptions
    @Binding var show: Bool
    @State private var libraryList: Bool = false
    @State private var bookName: String = ""
    @State private var writer: String = ""
    @State private var selecteddOption: BookSearchOptions = .bookName
    @State private var library: String = "Not selected"
    @State private var libraries = ["lib1", "lib2", "fvfvdv", "dfvdvdvd", "dfvdfv"]
    var body: some View {
        HStack{
            Button(action: {
                withAnimation(.snappy) {
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.black)
            })
            Spacer()
                Button(action: {
                    withAnimation(.default) {
                        page = .list
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundColor(.black)
                })
            
        }
        .padding(.horizontal)
        VStack(alignment: .leading){
            
            if selecteddOption == .bookName{
                Text("What to read?")
                HStack(spacing: 40){
                    TextField("book name", text: $bookName)
                        .font(.subheadline)
                    TextField("writer name", text: $writer)
                        .font(.subheadline)
                    
                    
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    HStack{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray)
                    }
                }
                
                
            }
            else{
                ColapsedPickerView(title: "What", description: "Add book you want")
                
            }
        }
        .padding()
        .frame(height: selecteddOption == .bookName ? 120 : 64)
        .font(.headline)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
        .onTapGesture {
            withAnimation(.snappy){
                selecteddOption = .bookName
                libraryList = false
            }
        }
        
        ZStack(alignment: .bottom){
            VStack(alignment: .leading){
                if selecteddOption == .library{
                    Text("Where to read?")
                    HStack{
                        Text("Choose library")
                        Spacer()
                        Text(library)
                            .onTapGesture {
                                libraryList.toggle()
                            }
                        
                        
                    }
                }
                else{
                    ColapsedPickerView(title: "Where", description: "Add library")
                }
                
                
            }
            .font(.headline)
            .padding()
            .frame(height: selecteddOption == .library ? 120 : 64)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture{
                withAnimation(.snappy){
                    selecteddOption = .library
                }
            }
            
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
    }
}


//#Preview {
//    SearchBook()
//}

struct ColapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(description)
                
            
        }
        
        
    }
}
