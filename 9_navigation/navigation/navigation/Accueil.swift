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
    @State var doitSelectionnerContact = false
    @State var contactSelectionne:String? = nil
    @State var afficherConfirmation = false
    var body: some View {
        VStack {
            Group {
                Text("Bienvenue dans votre app")
                
                //Liens standards
                NavigationLink("Aller à l'écran 2", destination: Ecran2())
                NavigationLink(destination: Ecran2()) {
                    HStack {
                        Image(systemName: "star")
                        Text("Ecran 2")
                        Image(systemName: "star")
                    }
                }
                
                //Lien déclenché via du code
                SecureField("Mot de passe", text: $motDePasseSaisi)
                Button("Aller à l'écran secret", action: boutonSecretTouché)
                NavigationLink(
                    destination: Ecran2(),
                    isActive: $motDePasseValide,
                    label: {
                        EmptyView()
                    })
                
                //Vue modale
                Button("Selectionner contact") {
                    doitSelectionnerContact.toggle()
                }.fullScreenCover(isPresented: $doitSelectionnerContact, content: {
                    ListeContacts(doitChoisirContact: $doitSelectionnerContact, contactChoisi: $contactSelectionne)
                })
                
                
                
            }.padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
        }.padding()
        .navigationTitle("Accueil")
    }
    
    func effectuerLaSuppression() {
        
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
        Group {
            NavigationView {
                Accueil()
            }
            .previewDevice("iPad Pro (9.7-inch)")
            NavigationView {
                Accueil()
            }
        }
    }
}
