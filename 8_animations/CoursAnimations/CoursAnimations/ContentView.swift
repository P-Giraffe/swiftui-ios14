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
                withAnimation(.easeInOut(duration: 4)) {
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
                .rotationEffect(.degrees(montrerLeTexte == true ? 60 : 0))
                .scaleEffect(montrerLeTexte ? 3.0 : 1.2)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
