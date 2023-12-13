//
//  ProfileViewModel.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var profile: Usser
    
    init(profile: Usser) {
        self.profile = profile
    }
    
    func setProfile(){
        DatabaseService.shared.setUser(user: self.profile) { result in
            switch result{
            case .success(let user):
                print(user)
            case .failure(_):
                print("error")
            }
        }
    }
    
    func getProfile(){
        DatabaseService.shared.getUser { result in
            switch result{
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
