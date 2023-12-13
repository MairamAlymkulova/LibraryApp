//
//  LibraryAppApp.swift
//  LibraryApp
//
//  Created by A Mairam on 10/11/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct LibraryApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
        if let user = FirebaseService.shared.getCurrentUser(){
            if user.uid == "N35D4QcSXlUt3GcSEjQnhZhUPcn1"{
                AdminContentView()
            }
            else{
                UsersContentView()

            }
        }else{
            AuthView()
        }
    }
  }
}
