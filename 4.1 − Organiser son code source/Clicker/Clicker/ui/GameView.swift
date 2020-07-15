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
    
    var isOnFire: Bool {
        guard let bestScore = gameManager.bestGame?.score else { return false }
        return score > bestScore
    }
    
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $nickname)
            HStack {
                if isOnFire {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .padding()
            }.font(.title)
            
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        userTouchedClickButton()
                    }
            }
            if gameManager.resultList.count > 0 {
                HStack {
                    Image(systemName: "star")
                    Text("Hall of fame")
                    Image(systemName: "star")
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
