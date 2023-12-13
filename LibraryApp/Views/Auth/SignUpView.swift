//
//  SignUp.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Binding var showSignUP: Bool
    var body: some View {
        
        
        VStack{
            Text("Sign Up")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextFieldUI(
                label: "Email",
                exampleText: "example@gmail.com",
                value: $email
            )
            TextFieldUI(
                label: "Password",
                exampleText: "password123",
                value: $password,
                isPassword: true
            )
            
            TextFieldUI(
                label: "Confirm Password",
                exampleText: "password123",
                value: $confirmPassword,
                isPassword: true
            )
            Button(action: {
                if password == confirmPassword, !password.isEmpty{
                    Auth.auth().createUser(
                        withEmail: email,
                        password: password
                    ) { authResult, error in
                        if let authResult{
                            let mUser = Usser(id: authResult.user.uid,
                                              name: "",
                                              thirname: "",
                                              password: "")
                            DatabaseService.shared.setUser(user: mUser) { result in
                                print("User created succesfuly")
                                showSignUP = false
                            }
                            
                        }else{
                            print("Error user create \(error)")
                        }
                        // ...
                    }
                }
                
                
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Circle())
                    .shadow(color: .indigo, radius: 5)
                
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
        }
            .padding()
    }
}

