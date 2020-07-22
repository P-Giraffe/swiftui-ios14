//
//  TaskCell.swift
//  Tasks
//
//  Created by Maxime Britto on 22/07/2020.
//

import SwiftUI

struct TaskCell: View {
    let task:Task
    var body: some View {
        HStack {
            Text(task.name)
                .font(.title2)
            Spacer()
            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                .font(.title)
        }.padding()
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskCell(task: Task(name: "Changer le monde"))
            TaskCell(task: Task(name: "Changer le monde", isDone: true))
        }
        .previewLayout(.fixed(width: 500.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}

