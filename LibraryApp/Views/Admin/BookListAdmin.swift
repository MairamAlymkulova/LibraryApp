//
//  BookListAdmin.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct BooksListAdmin: View {
    @State var showBookInfo: Bool = false
    var body: some View {

        if showBookInfo{
            BookInfo(show: $showBookInfo)
        }else{
            VStack{
                HStack(alignment: .top, spacing: 10){
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Поющие в терновнике")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        Text("Автор: Коллин маккалоу")
                            .font(.system(size: 20))
                        
                    }
                }
                .padding(.horizontal, 5)
                .onTapGesture {
                    withAnimation (.snappy) {
                        showBookInfo.toggle()
                    }
                }
                
                ScrollView {
                    Text("Библтотека им. Баялинова")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    BooksListUser()
}
