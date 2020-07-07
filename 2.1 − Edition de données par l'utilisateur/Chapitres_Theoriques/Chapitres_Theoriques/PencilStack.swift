//
//  PencilStack.swift
//  Chapitres_Theoriques
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct PencilStack: View {
    var body: some View {
        HStack {
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
            Text("Ajouter un stylo")
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
        }
    }
}

struct PencilStack_Previews: PreviewProvider {
    static var previews: some View {
        PencilStack()
    }
}
