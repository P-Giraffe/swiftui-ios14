//
//  RemoteDataManager.swift
//  Clicker
//
//  Created by Maxime Britto on 16/12/2020.
//

import Foundation

class RemoteDataManager {
    init(webserviceBaseUrl: String) {
        self.webserviceBaseUrl = webserviceBaseUrl
    }
    
    let webserviceBaseUrl:String
    
    
    func checkUserCredentials(identifier:String, password:String) -> Result<User,LoginError> {
        if identifier == "erreur" {
            return Result.failure(LoginError.unknown(message: "Perte de connexion Internet."))
        }
        if password == "ok" {
            return Result.success(User(nickname: identifier, email: identifier))
        } else {
            return Result.failure(LoginError.invalidCredentials)
        }
    }
}
