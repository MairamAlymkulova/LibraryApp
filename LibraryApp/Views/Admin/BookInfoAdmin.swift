//
//  BookInfoAdmin.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI

struct BookInfoAdmin: View {
    @Binding var show: Bool
    var body: some View {

        HStack{
            Button(action: {
                withAnimation(.snappy){
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
            VStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Поющие в терновнике")
                    .font(.title)
                Text("Автор: Коллин маккалоу")
                    .font(.system(size: 20))
                
            }
            VStack{
                Text("fdfbbfdjbjhdfbjhbsjdbgdjbgdjhbgdhbdjhbgjdbgjhdbgjdbgjdhbjdhbgdjhbjsbhdjhbfdhjgbdsjhbgjhdbgjdhsbjshbjsbhgjkhdbgdfhgjkhdjgfhjkdhgksdhgkjdfshgjkdghkdshgskjdhgkjshgskhgdkghdkshgdk")
            }
            .padding()
        Spacer()
            
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}
//
//#Preview {
//    BookInfo()
//}
