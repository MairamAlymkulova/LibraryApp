//
//  AdminContentView.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI

struct AdminContentView: View {
    @State private var pageType: PageOptions = .search
    @State private var logout: Bool = false
    var body: some View {
        NavigationView{
            VStack{
                if pageType == .search{
                    SearchBookView(page: $pageType)
                }
                else if pageType == .list{
                    BooksListUser()
                }
                else{
                    UserProfileView(logout: $logout)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        pageType = .list
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
