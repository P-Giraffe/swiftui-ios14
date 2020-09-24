//
//  ContentView.swift
//  ressources
//
//  Created by Maxime Britto on 16/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("hall_fame")
            Text("Hello, world!")
                .padding()
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
