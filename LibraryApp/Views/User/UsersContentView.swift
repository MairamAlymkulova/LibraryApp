//
//  ContentView.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI

struct UsersContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                SearchBookView()
                HStack{
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "list.bullet.circle")
                            .imageScale(.large)
                            .shadow(color:.gray,radius: 2)
                    })
                    
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass.circle")
                            .imageScale(.large)
                            .shadow(color:.gray,radius: 2)
                    })
                    
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .shadow(color:.gray,radius: 2)
                    })
                    Spacer()
                }
            }
            .foregroundColor(.black)
            
        }
    }
    
}

#Preview {
    UsersContentView()
}
