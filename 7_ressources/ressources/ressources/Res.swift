//
//  Res.swift
//  ressources
//
//  Created by Maxime Britto on 24/09/2020.
//

import SwiftUI

struct Res {
    enum Images : String {
        case hallOfFame = "hall_fame"
        
        var image: Image { Image(self.rawValue) }
    }
    
    enum Colors : String {
        case danger = "DangerColor"
        
        var color: Color { Color(self.rawValue) }
    }
}
