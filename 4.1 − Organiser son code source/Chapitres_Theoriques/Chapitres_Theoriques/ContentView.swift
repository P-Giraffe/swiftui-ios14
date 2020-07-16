//
//  ContentView.swift
//  Chapitres_Theoriques
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI



struct ContentView: View {
    @State var score:Int? = nil
    var displayedScore: String {
        guard let s = self.score else { return "La partie n'a pas encore commencé" }
        return "Score : \(s)"
    }
    var body: some View {
        VStack {
            Text(displayedScore)
            Button("Ajouter point", action: addButtonTouched)
        }
    }
    
    func addButtonTouched() {
        var score = self.score ?? 0
        score += 1
        self.score = score
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
