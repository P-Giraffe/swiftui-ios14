//
//  ContentView.swift
//  navigation
//
//  Created by Maxime Britto on 11/12/2020.
//

import SwiftUI

struct Accueil: View {
    var body: some View {
        VStack {
            Text("Bienvenue dans votre app")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Accueil()
    }
}
