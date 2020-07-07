//
//  EditableTextView.swift
//  Clicker
//
//  Created by Maxime Britto on 07/07/2020.
//

import SwiftUI

struct EditableTextView: View {
    @Binding var editedText:String
    var body: some View {
        HStack {
            Text(editedText)
            Image(systemName: "pencil.circle")
        }
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(editedText: .constant("Leonard"))
            .previewLayout(.sizeThatFits)
    }
}
