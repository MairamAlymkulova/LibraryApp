//
//  ContentView.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI

struct UsersContentView: View {
    @State private var pageType: PageOptions = .search
    @State private var logout: Bool = false
    @State var bookName: String? = nil
    @State var writer: String? = nil
    @State var library: String? = nil
    @State private var shouldUpdateView: Bool = false // Added state to trigger view update

    var body: some View {
        NavigationView{
            VStack{
                if pageType == .search{
                    SearchBookView(bookName: $bookName, writer: $writer, library: $library, page: $pageType)
                    
                }
                else if pageType == .list{
                    BooksListUser(bookName: $bookName, writer: $writer, library: $library)
                        .id(shouldUpdateView ? "list_updated" : nil) // Use 'id' to force view update

                }
                else{
                    UserProfileView(logout: $logout)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        pageType = .list
                        bookName = nil
                        writer = nil
                        library = nil
                        shouldUpdateView.toggle()
                    }, label: {
                        Image(systemName: "list.bullet.circle")
                            .imageScale(.large)
                            .shadow(color: pageType == .list ? .purple : .gray,radius: 2)
                    })
                    
                    Spacer()
                    Button(action: {
                        pageType = .search
                    }, label: {
                        Image(systemName: "magnifyingglass.circle")
                            .imageScale(.large)
                            .shadow(color: pageType == .search ? .purple : .gray,radius: 2)
                    })
                    
                    Spacer()
                    Button(action: {
                        pageType = .user
                    }, label: {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .shadow(color: pageType == .user ? .purple : .gray,radius: 2)
                    })
                    Spacer()
                }
                NavigationLink(
                    destination: AuthView(),
                    isActive: $logout,
                    label: {})
                .hidden()
            }
            
        }
        .foregroundColor(.black)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    UsersContentView()
}
