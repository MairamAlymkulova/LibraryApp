//
//  TextField.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI

struct TextFieldUI: View {
    @State var label: String
    @State var exampleText: String
    @Binding var value: String
    var isPassword: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(label)
                .font(.title2)
            if isPassword{
                SecureField(exampleText, text: $value)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .padding(.top, 5)
                
            }
            else{
                TextField(exampleText, text: $value)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .padding(.top, 5)
                
            }
            Divider()
        }
        .padding(.top, 20)
        
    }
}

