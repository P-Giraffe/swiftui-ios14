//
//  PencilStack.swift
//  Chapitres_Theoriques
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct PencilStack: View {
    let title:String
    @Binding var clickCount:Int
    var body: some View {
        HStack {
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
            Text(title)
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(9.0)
        .onTapGesture {
            clickCount = clickCount + 1
        }
    }
}

struct PencilStack_Previews: PreviewProvider {
    static var previews: some View {
        PencilStack(title: "Ajouter un crayon", clickCount: .constant(5))
    }
}
