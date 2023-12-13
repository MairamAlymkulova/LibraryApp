//
//  AuthView.swift
//  LibraryApp
//
//  Created by A Mairam on 12/12/23.
//

import SwiftUI

struct AuthView: View {
    @State private var showSignUp = false
    @State var isLogedIn: Bool = false
    @State var admin: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {

//                Image("background")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        
                        if showSignUp {
                            SignUpView(showSignUP: $showSignUp)

                                .transition(.asymmetric(insertion: .slide, removal: .slide))
                        } else {
                            SignInView(isLogedIn: $isLogedIn, admin: $admin)
                                .transition(.asymmetric(insertion: .slide, removal: .slide))

                        }
                    }
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity,  alignment: .top)
                    .padding(.top, UIScreen.main.bounds.height/6)
                    

                    NavigationLink(
                        destination: UsersContentView(),
                        isActive: $isLogedIn,
                        label: {})
                }
                .overlay(alignment: .bottom){
                    
                    HStack {
                        Text(showSignUp ? "Already have an account?" : "Create account?")
                            .fontWeight(.bold)
                        
                        Button(action: {
                            withAnimation {
                                showSignUp.toggle()
                            }
                        }, label: {
                            Text(showSignUp ? "Sign In" : "Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.indigo)
                        })
                    }
                    
                }
               

                
            }
            

        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        
    }
}
//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthView()
//    }
//}
