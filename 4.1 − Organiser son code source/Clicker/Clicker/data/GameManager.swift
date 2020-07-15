//
//  GameManager.swift
//  Clicker
//
//  Created by Maxime Britto on 15/07/2020.
//

import Foundation

class GameManager : ObservableObject {
    @Published var resultList:[GameResult] = []
    @Published var bestScore = 0
    @Published var bestNickname = ""
    
    func gameDidFinish(username:String, score:Int) {
        if score > bestScore {
            bestScore = score
            bestNickname = username
        }
        let result = GameResult(playerName: username, score: score)
        resultList.append(result)
    }
}
