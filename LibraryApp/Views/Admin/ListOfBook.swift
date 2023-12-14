//
//  SwiftUIView.swift
//  LibraryApp
//
//  Created by A Mairam on 14/12/23.
//

import SwiftUI

struct ListOfBook: View {
    var img: String
    var bookName: String
    var writerName: String
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            Image(img)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10){
                Text(bookName)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text(writerName)
                    .font(.system(size: 20))
                
            }
        }
        .padding(.horizontal, 5)
    }
}

//#Preview {
//    ListOfBook()
//}
