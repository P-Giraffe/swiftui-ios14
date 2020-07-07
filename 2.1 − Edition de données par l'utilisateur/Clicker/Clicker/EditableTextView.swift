//
//  EditableTextView.swift
//  Clicker
//
//  Created by Maxime Britto on 06/07/2020.
//

import SwiftUI

struct EditableTextView: View {
    @Binding var editedText:String
    var body: some View {
        HStack {
            Text(editedText)
            Image(systemName: "pencil")
        }
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(editedText: .constant("Sheldon"))
    }
}
