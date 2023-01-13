//
//  ContentView.swift
//  webservice-exercice-start
//
//  Created by Maxime Britto on 03/09/2021.
//

import SwiftUI

struct User:Identifiable, Codable {
    let id:Int
    let name:String
    let email:String
}

struct ContentView: View {
    @State var userList:[User] = []
    @State var isLoading = false
    var body: some View {
        VStack {
            if isLoading {
                VStack {
                    ProgressView()
                    Text("Chargement en cours")
                }
            } else {
                List(userList) { user in
                    Text(user.name)
                }
            }
        }.task {
            await loadUserList()
        }
    }
    
    func loadUserList() async {
        guard let userListApiUrl = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
        isLoading = true
        var request = URLRequest(url: userListApiUrl)
        request.httpMethod = "GET"
        
        do {
            let (userListData, response) = try await URLSession.shared.data(for: request, delegate: nil)
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode >= 200 && httpResponse.statusCode < 300,
               let downloadedUserList = try? JSONDecoder().decode([User].self, from: userListData) {
                self.userList = downloadedUserList
            }
            
        } catch {
            
        }
        isLoading = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
