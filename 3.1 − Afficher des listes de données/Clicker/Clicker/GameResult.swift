//
//  GameResult.swift
//  Clicker
//
//  Created by Maxime Britto on 09/07/2020.
//

import Foundation

struct GameResult : Identifiable {
    let id = UUID()
    let playerName:String
    let score:Int
}
