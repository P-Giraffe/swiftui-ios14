//
//  GameResultListView.swift
//  Clicker
//
//  Created by Maxime Britto on 09/07/2020.
//

import SwiftUI

struct GameResultListView: View {
    let resultList:[GameResult]
    var body: some View {
        List(resultList) { (result:GameResult) in
            Text("\(result.playerName) - \(result.score)")
        }
    }
}


struct GameResultListView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultListView(resultList: [
            GameResult(playerName: "Sheldon", score: 20),
            GameResult(playerName: "Leonard", score: 30),
            GameResult(playerName: "Ian", score: 10),
            GameResult(playerName: "Poppy", score: 100),
        ])
        .previewLayout(.sizeThatFits)
    }
}
