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
            if isLoading {
                ProgressView("Chargement des utilisateurs")
            } else {
                List(userList) { user in
                    Text(user.name)
                }.padding()
            }
        }
        .onAppear {
            loadUserList()
        }
    }
    
    func loadUserList() {
        guard let userListApiUrl = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
        let urlSession = URLSession.shared
        
        var request = URLRequest(url: userListApiUrl)
        request.httpMethod = "GET"
        request.addValue("Bearer AHGDSKHJDKH", forHTTPHeaderField: "Authorization")
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 && httpResponse.statusCode < 300,
                  let userListJsonData = data,
                  let downloadedUserList = try? JSONDecoder().decode([User].self, from: userListJsonData) else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            DispatchQueue.main.async {
                self.userList = downloadedUserList
                self.isLoading = false
            }
        }
        
        
        isLoading = true
        dataTask.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
