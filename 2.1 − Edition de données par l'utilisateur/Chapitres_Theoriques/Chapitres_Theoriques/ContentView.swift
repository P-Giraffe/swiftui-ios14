//
//  ContentView.swift
//  Chapitres_Theoriques
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("orderName") var orderName = ""
    @State var pencilCount = 0
    @State var penCount = 0
    var body: some View {
        VStack {
            TextField("Nom de la commande", text: $orderName)
            PencilStack(title: "Ajouter un stylo", clickCount: $penCount)
                .padding()
            PencilStack(title: "Ajouter un crayon", clickCount: $pencilCount)
                .padding()
            Text("Nombre total d'éléments commandés pour \(orderName) : \(pencilCount + penCount)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
