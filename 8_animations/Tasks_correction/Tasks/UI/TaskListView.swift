//
//  ContentView.swift
//  Tasks
//
//  Created by Maxime Britto on 22/07/2020.
//

import SwiftUI

extension AnyTransition {
    static var alphaMove:AnyTransition {
        let moveIn = AnyTransition.move(edge: .top).combined(with: .opacity)
        let moveOut = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        return AnyTransition.asymmetric(insertion: moveIn, removal: moveOut)
    }
}

struct TaskListView: View {
    @State var newTaskName:String = ""
    @State var taskManager = TaskManager()
    @State var isCreatingNewTask = false
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isCreatingNewTask.toggle()
                }
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(isCreatingNewTask ? 45 : 0))
                    .padding()
                    .scaleEffect(isCreatingNewTask ? 1.5 : 1)
                    .animation(.easeIn)

            })
            if isCreatingNewTask {
                HStack {
                    
                    TextField("Nouvelle tâche", text: $newTaskName.animation())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if newTaskName.isEmpty == false {
                    Button(action: createNewTask, label: {
                        Image(systemName: "plus")
                    }).disabled(newTaskName.count == 0)
                    .transition(.move(edge: .trailing))
                    }
                }
                .padding()
                .transition(.alphaMove)
            }
            
            VStack(alignment: HorizontalAlignment.leading ) {
                ForEach(taskManager.taskList.sorted(by: {$0.name <= $1.name })) { task in
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
            //withAnimation {
            taskManager.addTask(withName: newTaskName)
            newTaskName = ""
            //}
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
