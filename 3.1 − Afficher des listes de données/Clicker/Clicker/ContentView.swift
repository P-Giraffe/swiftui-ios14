//
//  ContentView.swift
//  Clicker
//
//  Created by Maxime Britto on 24/06/2020.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var resultList:[GameResult] = []
    
    @AppStorage("nickname") var nickname = "Sheldon"
    @AppStorage("bestScore") var bestScore = 0
    @AppStorage("bestNickname") var bestNickname = ""
    @State var gameIsInProgress = false
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $nickname)
            HStack {
                if score >= bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .padding()
            }.font(.title)
            if bestScore > 0 {
                HStack {
                    Image(systemName: "star")
                    Text("\(bestNickname) - \(bestScore)")
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
        if score > bestScore {
            bestScore = score
            bestNickname = nickname
        }
        let result = GameResult(playerName: nickname, score: score)
        resultList.append(result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
