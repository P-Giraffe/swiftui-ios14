//
//  ContentView.swift
//  Clicker
//
//  Created by Maxime Britto on 24/06/2020.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel:GameViewModel
    
    init(userManager:UserManager) {
        self.viewModel = GameViewModel(userManager: userManager)
    }
    
    var body: some View {
        VStack {
            HStack {
                if viewModel.isOnFire {
                    Image(systemName: "flame")
                }
                Text("Score : \(viewModel.score)")
                    .padding()
            }.font(.title)
            
            if viewModel.gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        viewModel.userTouchedClickButton()
                    }
            }
            if viewModel.shouldDisplayResultList {
                HStack {
                    Image(systemName: "star")
                    Text("Hall of fame")
                    Image(systemName: "star")
                }
            }
            GameResultListView(resultList: viewModel.gameManager.resultList)
            Spacer()
            if viewModel.gameIsInProgress == false {
                Button("Start new game") {
                    viewModel.startGame()
                }.padding()
            }
        }.navigationTitle("Clicker")
        .navigationBarItems(
            leading:NavigationLink("Settings", destination: SettingsView()) ,
            trailing: Button("Logout", action: viewModel.logout))
        .fullScreenCover(isPresented: $viewModel.shouldDisplayLoginView, content: {
            LoginView(userManager: viewModel.userManager, credentialsAreAccepted: $viewModel.shouldDisplayLoginView)
        })
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView(userManager: UserManager(webservice: RemoteDataManager(webserviceBaseUrl: "")))
        }
    }
}
