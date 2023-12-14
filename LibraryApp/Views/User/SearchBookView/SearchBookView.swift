//
//  SearchBookView.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct SearchBookView: View {
    @State private var showSearchView: Bool = false
    @Binding var bookName: String?
    @Binding var writer: String?
    @Binding var library: String?
    @Binding var page: PageOptions
    var body: some View {
        if showSearchView{
            Spacer()
            SearchBook(page: $page,
                            show: $showSearchView,
                            bookName: $bookName,
                            writer: $writer,
                            library: $library)
            Spacer()

        }
        else{
            VStack{
                
                Text("Find your \n to book")
                    .font(.system(size: 46))
                    .padding()
                
                HStack{
                    Image(systemName: "book")
                        .imageScale(.large)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("Wich one ?")
                            .font(.system(size: 20, weight: .semibold))
                        Text("Any thing-Any when")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.snappy) {
                            showSearchView.toggle()

                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .shadow(color: .gray, radius: 2)
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .overlay {
                    Capsule()
                        .stroke(lineWidth: 0.5)
                        .foregroundColor(.gray)
                        .shadow(color: .black.opacity(0.2),radius: 2)
                }
                .padding()
                .onTapGesture {
                    withAnimation(.snappy) {
                        showSearchView.toggle()

                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight:.infinity, alignment:.leading)
        }
    }
}
//
//#Preview {
//    SearchBookView()
//}
