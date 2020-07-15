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
}
