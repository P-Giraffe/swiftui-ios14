//
//  ContentView.swift
//  navigation
//
//  Created by Maxime Britto on 11/12/2020.
//

import SwiftUI

struct Accueil: View {
    @State var motDePasseSaisi = ""
    @State var motDePasseValide = false
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
            SecureField("Mot de passe", text: $motDePasseSaisi)
            Button("Aller à l'écran secret", action: boutonSecretTouché)
            NavigationLink(
                destination: Ecran2(),
                isActive: $motDePasseValide,
                label: {
                    EmptyView()
                })
        }.padding()
        .navigationTitle("Accueil")
        
    }
    
    func boutonSecretTouché() {
        if motDePasseSaisi == "J'aime Purple Giraffe" {
            motDePasseValide = true
        } else {
            motDePasseValide = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Accueil()
        }
    }
}
