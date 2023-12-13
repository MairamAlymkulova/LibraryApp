//
//  ProfileUserView.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI
struct UserProfileView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isEditMode = false
    @Binding var logout: Bool
//    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        NavigationView {
            VStack {
                if isEditMode {
//                    EditProfileView(isEditMode: $isEditMode, viewModel: viewModel)
                } else {
                    Button(action: {
                                    isImagePickerPresented.toggle()
                    }) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 5)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 5)
                        }
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    Text("Mairam Alymkulova")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    if let currentUser = FirebaseService.shared.getCurrentUser() {
                        Text("Электронная почта: \(currentUser.email ?? "")")
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    } else {
                        // Обработка случая, когда пользователь не авторизован
                        Text("Пользователь не авторизован")
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }

                
                    Spacer()
                    
                       Button(action: {
                        // Действие по нажатию на кнопку выхода
                        FirebaseService.shared.signOut()
                        logout.toggle()
                        
                    }) {
                        Text("Выйти")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                
            }
            .padding()
            .navigationBarTitle("Профиль", displayMode: .inline)
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Ошибка"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}
