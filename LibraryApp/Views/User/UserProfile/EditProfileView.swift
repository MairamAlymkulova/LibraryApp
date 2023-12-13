//
//  EditProfileView.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import SwiftUI



struct EditProfileView: View {
    @Binding var isEditMode: Bool
    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            
            TextField("Имя", text: $viewModel.profile.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Фамилия", text: $viewModel.profile.thirname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Новый пароль", text: $viewModel.profile.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                viewModel.setProfile()
            }) {
                Text("Сохранить изменения")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .onAppear{
            viewModel.getProfile()
        }
        .padding()
        .navigationBarTitle("Редактирование профиля", displayMode: .inline)
    }
}
