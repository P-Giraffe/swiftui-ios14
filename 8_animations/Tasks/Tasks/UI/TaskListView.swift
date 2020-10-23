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
    @State var isCreatingTask = false
    var body: some View {
        VStack {
            Button(action:{
                withAnimation {
                    isCreatingTask.toggle()
                }
            }, label:{
                Image(systemName:"plus.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(isCreatingTask ? 45 : 0))
                    .scaleEffect(isCreatingTask ? 2.0 : 1.0)
                    .padding()
            })
            if isCreatingTask {
                HStack {
                    TextField("Nouvelle tâche", text: $newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: createNewTask, label: {
                        Image(systemName: "plus")
                    }).disabled(newTaskName.count == 0)
                }.padding()
            }
            
            VStack(alignment: HorizontalAlignment.leading ) {
                ForEach(taskManager.taskList) { task in
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
            taskManager.addTask(withName: newTaskName)
            newTaskName = ""
        }
    }
    
    func userTappedTask(_ task:Task) {
        taskManager.toggleTaskStatus(withId: task.id)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
