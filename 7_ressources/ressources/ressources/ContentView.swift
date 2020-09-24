//
//  ContentView.swift
//  ressources
//
//  Created by Maxime Britto on 16/09/2020.
//

import SwiftUI
import DynamicColor

struct ContentView: View {
    var body: some View {
        VStack {
            Res.Images.hallOfFame.image
            Text("Hello, world!")
                .padding()
                .foregroundColor(Color.primary)
            Text("Purple Giraffe")
                .padding()
                .foregroundColor(Color.accentColor)
            Button("Effacer") {
                
            }.foregroundColor(Res.Colors.danger.color)
            if let url = URL(string: "https://www.purplegiraffe.fr") {
                Link("Ouvrir le site", destination: url)
                    .foregroundColor(Color(hex: 0x3498db))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
