//
//  DataManager.swift
//  Emoji Rangers
//
//  Created by Maxime Britto on 18/12/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class DataManager {
    let groupId = "group.fr.purplegiraffe.emojiranger"
    func userDefaults() {
        if let userDefaults = UserDefaults(suiteName: groupId) {
            userDefaults.set("Max", forKey: "user")
        }
    }
    
    func fichiers() {
        if let folderUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupId) {
            print(folderUrl)
        }
    }
}
