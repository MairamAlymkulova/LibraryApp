//
//  BookInfo.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI
struct BookInfo: View {
    @Binding var show: Bool
    @Binding var book: Book?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "arrowshape.backward.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                })
                Spacer()
            }
            .padding()
            
            VStack {
                Image(book!.img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(book?.bookName ?? "")
                    .font(.title)
                    .padding()
                
                Text(book?.author ?? "")
                    .font(.system(size: 20))
                    .padding()
            }
            
            Text(book?.aboutBook ?? "")
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

    
//
//#Preview {
//    BookInfo()
//}
