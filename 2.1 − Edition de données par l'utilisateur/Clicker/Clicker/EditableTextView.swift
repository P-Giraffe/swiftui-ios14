//
//  EditableTextView.swift
//  Clicker
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct EditableTextView: View {
    @State var isEditing = false
    @Binding var editedText:String
    var body: some View {
        HStack {
            if isEditing == true {
                TextField("Pseudo", text: $editedText)
            } else {
                Text(editedText)
            }
            Image(systemName: "pencil.circle")
                .onTapGesture {
                    isEditing.toggle()
                }
        }
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(editedText: .constant("Leonard"))
            .previewLayout(.sizeThatFits)
    }
}
