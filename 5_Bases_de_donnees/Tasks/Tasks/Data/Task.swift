//
//  Task.swift
//  Tasks
//
//  Created by Maxime Britto on 23/07/2020.
//

import Foundation

struct Task : Identifiable {
    var id = UUID()
    let name : String
    var isDone = false
}

