//
//  ContentView.swift
//  Chapitres_Theoriques
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct Player : Identifiable {
    let id = UUID()
    let name:String
    let level:Int
}

struct ContentView: View {
    @State var playerList:[Player] = []
    var body: some View {
        VStack {
            Button("Ajouter joueur", action: addButtonTouched)
            List(playerList) { (player:Player) in
                HStack {
                    Text(player.name)
                    Image(systemName: "star")
                    Text(String(player.level))
                }
            }
        }
    }
    
    func addButtonTouched() {
        let newPlayer = Player(
            name: ["Riri", "Fifi", "Loulou"].randomElement()!,
            level: Int.random(in: 1...10))
        playerList.append(newPlayer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
