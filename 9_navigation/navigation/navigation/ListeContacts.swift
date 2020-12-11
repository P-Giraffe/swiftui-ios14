//
//  ListeContacts.swift
//  navigation
//
//  Created by Maxime Britto on 11/12/2020.
//

import SwiftUI

struct ListeContacts: View {
    var contactList:[String] = [
        "Ian",
        "Poppy",
        "Jo",
        "David",
        "Brad",
        "Rachel"
    ]
    var body: some View {
        List() {
            ForEach(contactList, id: \.self) { contact in
                Text(contact)
            }
        }
    }
}

struct ListeContacts_Previews: PreviewProvider {
    static var previews: some View {
        ListeContacts()
    }
}
