//
//  ContentView.swift
//  ExempleWebService
//
//  Created by Maxime Britto on 29/07/2020.
//

import SwiftUI

struct User:Identifiable, Codable {
    let id:Int
    let name:String
    let email:String
}

struct ContentView: View {
    @State var userList:[User] = []
    @State var isLoading = true
    var body: some View {
        VStack {
            List(userList) { user in
                Text(user.name)
            }
        }
    }
    
    func loadUserList() async {
        guard let userListApiUrl = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
