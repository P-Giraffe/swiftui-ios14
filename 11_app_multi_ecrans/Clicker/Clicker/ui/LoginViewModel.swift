//
//  LoginViewModel.swift
//  Clicker
//
//  Created by Maxime Britto on 17/12/2020.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var typedUsername:String = ""
    @Published var typedPassword:String = ""
    @Published var errorMessage:String?
    
    var userManager:UserManager?
    
    func submitCredentials(loginResult:@escaping (Bool)->Void) {
        guard typedUsername.isEmpty == false && typedPassword.isEmpty == false else {
            errorMessage = NSLocalizedString("Please type a username and a password before trying to login", comment: "")
            return
        }
        userManager?.loginUser(identifier: typedUsername, password: typedPassword) { (result) in
            switch result {
            case .success(_):
                self.errorMessage = nil
                loginResult(true)
            case .failure(let loginError):
                self.errorMessage = loginError.errorDescription
                loginResult(false)
            }
        }
        
    }
}
