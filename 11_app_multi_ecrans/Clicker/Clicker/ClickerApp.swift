//
//  ClickerApp.swift
//  Clicker
//
//  Created by Maxime Britto on 24/06/2020.
//

import SwiftUI

@main
struct ClickerApp: App {
    let userManager = UserManager(webservice: RemoteDataManager(webserviceBaseUrl: "https://www.mon-webservice.fr"))
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GameView(userManager: userManager)
            }
        }
    }
}
