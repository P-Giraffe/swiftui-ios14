//
//  GameManager.swift
//  Clicker
//
//  Created by Maxime Britto on 15/07/2020.
//

import Foundation

class GameManager : ObservableObject {
    @Published var resultList:[GameResult] = []
    var bestGame: GameResult? { resultList.first }
    
    func gameDidFinish(username:String, score:Int) {
        let result = GameResult(playerName: username, score: score)
        objectWillChange.send()
        resultList.append(result)
        resultList.sort { (result1, result2) -> Bool in
            result1.score > result2.score
        }
    }
}
