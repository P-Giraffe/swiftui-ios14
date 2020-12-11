//
//  ListeContacts.swift
//  navigation
//
//  Created by Maxime Britto on 11/12/2020.
//

import SwiftUI

struct ListeContacts: View {
    @Binding var doitChoisirContact:Bool
    @Binding var contactChoisi:String?
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
                Text(contact).onTapGesture {
                    contactChoisi = contact
                    doitChoisirContact = false
                }
            }
        }.frame(minWidth: 200, minHeight: 350)
    }
}

struct ListeContacts_Previews: PreviewProvider {
    static var previews: some View {
        ListeContacts(doitChoisirContact: .constant(true), contactChoisi: .constant(nil))
    }
}
