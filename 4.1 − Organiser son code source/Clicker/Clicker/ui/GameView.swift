//
//  ContentView.swift
//  Clicker
//
//  Created by Maxime Britto on 24/06/2020.
//

import SwiftUI

struct GameView: View {
    @AppStorage("nickname") var nickname = "Sheldon"
    @State var score = 0
    @State var gameIsInProgress = false
    
    @StateObject var gameManager = GameManager()
    
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $nickname)
            HStack {
                if score >= gameManager.bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .padding()
            }.font(.title)
            if gameManager.bestScore > 0 {
                HStack {
                    Image(systemName: "star")
                    Text("Hall of fame")
                    Image(systemName: "star")
                }
            }
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        userTouchedClickButton()
                    }
            }
            GameResultListView(resultList: gameManager.resultList)
            Spacer()
            if gameIsInProgress == false {
                Button("Nouvelle partie") {
                   userTouchedStartButton()
                }.padding()
            }
        }
    }
    
    func userTouchedStartButton() {
        score = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
            gameDidFinish()
        }
    }
    
    func userTouchedClickButton() {
        score = score + 1
    }
    
    func gameDidFinish() {
        gameIsInProgress = false
        gameManager.gameDidFinish(username: nickname, score: score)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
