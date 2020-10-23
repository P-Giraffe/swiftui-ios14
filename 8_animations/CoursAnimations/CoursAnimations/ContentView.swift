//
//  ContentView.swift
//  CoursAnimations
//
//  Created by Maxime Britto on 23/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State var montrerLeTexte = false
    var body: some View {
        VStack {
            Button(action : {
                montrerLeTexte.toggle()
            },
            label: {
                Image(systemName: montrerLeTexte ? "eye.slash" : "eye")
                    .imageScale(.large)
            })
            if montrerLeTexte {
                Text("J'adoooooore Purple Giraffe <3")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
