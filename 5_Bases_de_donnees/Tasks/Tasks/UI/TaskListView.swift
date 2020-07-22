//
//  ContentView.swift
//  Tasks
//
//  Created by Maxime Britto on 22/07/2020.
//

import SwiftUI

struct TaskListView: View {
    @State var newTaskName:String = ""
    @State var taskManager = TaskManager()
    @State var taskList = [
        Task(name:"Terminer cours SwiftUI"),
        Task(name:"Préparer prochain défi Purple Giraffe"),
        Task(name:"Commencer le cours secret")]
    var body: some View {
        VStack {
            HStack {
                TextField("Nouvelle tâche", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: createNewTask, label: {
                    Image(systemName: "plus")
                }).disabled(newTaskName.count == 0)
            }.padding()
            
            
            VStack(alignment: HorizontalAlignment.leading ) {
                ForEach(taskList) { task in
                    TaskCell(task: task)
                        .onTapGesture {
                            userTappedTask(task)
                        }
                }
            }
            Spacer()
        }
    }
    
    func createNewTask() {
        if newTaskName.count > 0 {
            taskList.append(Task(name: newTaskName))
            newTaskName = ""
        }
    }
    
    func userTappedTask(_ task:Task) {
        if let taskIndex = taskList.firstIndex(where: { (t) -> Bool in t.id == task.id }) {
            taskList[taskIndex].isDone.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
