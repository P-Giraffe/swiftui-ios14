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
        Text(editedText)
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(editedText: .constant("Leonard"))
    }
}
