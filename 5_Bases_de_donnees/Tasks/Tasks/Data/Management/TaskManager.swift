//
//  TaskManager.swift
//  Tasks
//
//  Created by Maxime Britto on 23/07/2020.
//

import Foundation

struct TaskManager {
    var taskList:[Task]
    let storage:CoreDataStorage = CoreDataStorage()
    
    init() {
        taskList = storage.fetchTaskList()
    }
}
