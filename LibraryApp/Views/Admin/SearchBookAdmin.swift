//
//  SearchBookAdmin.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct SearchBookAdmin: View {
//    @State var show: Bool = true
    @Binding var page: PageOptions
    @Binding var show: Bool
    @Binding var bookName: String?
    @Binding var writer: String?
    @Binding var library: String?
    @State private var libraryList: Bool = false
    @State private var selecteddOption: BookSearchOptions = .bookName
    @State private var libraries = ["Library №14", "Library №24", "City Library №10", "City Library №11", "City Library №12 named after I. Razzakov", "City Library №13 named after S. Orozbakov", "City Library №15 named after Togolok Moldo", "City Library №17", "City Library №18 named after J. Bokonbaev"]
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
                Text("What to edit?")
                HStack(spacing: 40){
                    TextField("book name", text: Binding(
                        get: { bookName ?? "" },
                        set: { bookName = $0.isEmpty ? nil : $0 }
                    ))
                        .font(.subheadline)
                    TextField("writer name", text: Binding(
                        get: { writer ?? "" },
                        set: { writer = $0.isEmpty ? nil : $0 }
                    ))
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
                    Text("Where is it?")
                    HStack{
                        Text("Choose library")
                        Spacer()
                        TextField("book name", text: Binding(
                            get: { library ?? "Not selected" },
                            set: { library = $0.isEmpty ? nil : $0 }
                        ))
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

