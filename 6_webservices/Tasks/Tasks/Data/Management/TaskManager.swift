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
    
    @discardableResult
    mutating func addTask(withName taskName:String) -> Task {
        let newTask = Task(name: taskName)
        taskList.append(newTask)
        storage.addNewTask(task: newTask)
        return newTask
    }
    
    mutating func toggleTaskStatus(withId taskId:UUID) {
        if let taskIndex = taskList.firstIndex(where: { (t) -> Bool in t.id == taskId }) {
            taskList[taskIndex].isDone.toggle()
            storage.updateTask(task: taskList[taskIndex])
        }
    }
}
