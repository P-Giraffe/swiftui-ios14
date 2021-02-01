//
//  GameViewModel.swift
//  Clicker
//
//  Created by Maxime Britto on 17/12/2020.
//

import Foundation

class GameViewModel : ObservableObject {
    @Published var gameManager = GameManager()
    @Published var shouldDisplayLoginView:Bool
    @Published var score = 0
    @Published var gameIsInProgress = false
    
    let userManager:UserManager
    
    init(userManager:UserManager) {
        self.userManager = userManager
        shouldDisplayLoginView = userManager.currentUser == nil
    }
    
    func logout() {
        userManager.logout()
        shouldDisplayLoginView = true
    }
    
    var isOnFire: Bool {
        guard let bestScore = gameManager.bestGame?.score else { return false }
        return score > bestScore
    }
    
    var shouldDisplayResultList: Bool {
        gameManager.resultList.isEmpty == false
    }
    
    func startGame() {
        objectWillChange.send()
        score = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
            self.gameDidFinish()
        }
    }
    
    func userTouchedClickButton() {
        if gameIsInProgress {
            objectWillChange.send()
            score = score + 1
            
        }
    }
    
    func gameDidFinish() {
        objectWillChange.send()
        gameIsInProgress = false
        if let nickname = self.userManager.currentUser?.nickname {
            gameManager.gameDidFinish(username: nickname, score: score)
        }
    }
}
