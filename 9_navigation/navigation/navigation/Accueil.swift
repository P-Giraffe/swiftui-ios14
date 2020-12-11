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
            NavigationLink("Aller à l'écran 2", destination: Ecran2())
            NavigationLink(destination: Ecran2()) {
                HStack {
                    Image(systemName: "star")
                    Text("Ecran 2")
                    Image(systemName: "star")
                }
            }
                
        }.padding()
        .navigationTitle("Accueil")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Accueil()
        }
    }
}
