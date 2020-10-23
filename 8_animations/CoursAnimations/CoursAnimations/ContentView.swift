//
//  ContentView.swift
//  CoursAnimations
//
//  Created by Maxime Britto on 23/10/2020.
//

import SwiftUI

extension AnyTransition {
    static var moveWithOpacity:AnyTransition {
        let moveIn = AnyTransition.move(edge: .bottom).combined(with: .opacity)
        let moveOut = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        return AnyTransition.asymmetric(insertion: moveIn, removal: moveOut)
    }
}

struct ContentView: View {
    @State var montrerLeTexte = false
    var body: some View {
        VStack {
            Button(action : {
                withAnimation {
                    montrerLeTexte.toggle()
                }
            },
            label: {
                Image(systemName: montrerLeTexte ? "eye.slash" : "eye")
                    .imageScale(.large)
            })
            if montrerLeTexte {
                Text("J'adoooooore Purple Giraffe <3")
                    .padding()
                    .transition(.moveWithOpacity)
            }
            Image(systemName: "trash")
                .imageScale(.large)
                .rotationEffect(.degrees(60))
                .scaleEffect(2.0)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
