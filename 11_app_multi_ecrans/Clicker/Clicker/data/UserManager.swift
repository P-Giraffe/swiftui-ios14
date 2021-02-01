//
//  UserManager.swift
//  Clicker
//
//  Created by Maxime Britto on 16/12/2020.
//

import Foundation

class UserManager {
    private let webservice:RemoteDataManager
    var currentUser:User?
    
    init(webservice:RemoteDataManager) {
        self.webservice = webservice
    }
    
    func loginUser(identifier:String, password:String, resultHandler:@escaping (Result<User,LoginError>)->Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            let loginResult = self.webservice.checkUserCredentials(identifier: identifier, password: password)
            switch loginResult {
            case .success(let user):
                self.currentUser = user
            default:
                break;
            }
            DispatchQueue.main.async {
                resultHandler(loginResult)
            }
        }
    }
    
    func logout() {
        currentUser = nil
    }
}

enum LoginError:Error {
    case invalidCredentials
    case unknown(message:String)
}

extension LoginError : LocalizedError {
    var errorDescription: String? {
        let description:String
        switch self {
        case .invalidCredentials:
            description = NSLocalizedString("The provided credentials were refused by the server", comment: "")
        case .unknown(let message):
            description = message
        }
        return description
    }
}
