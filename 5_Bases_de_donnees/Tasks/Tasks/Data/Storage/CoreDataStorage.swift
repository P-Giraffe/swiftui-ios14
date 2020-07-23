//
//  CoreDataStorage.swift
//  Tasks
//
//  Created by Maxime Britto on 23/07/2020.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Tasks")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func fetchTaskList() -> [Task] {
        let taskList:[Task]
        let fetchRequest:NSFetchRequest<CDTask> = CDTask.fetchRequest()
        if let rawTaskList = try? context.fetch(fetchRequest) {
            taskList = rawTaskList.compactMap({ (rawTask:CDTask) -> Task? in
                Task(fromCoreDataObject: rawTask)
            })
        } else {
            taskList = []
        }
        return taskList
    }
    
    func addNewTask(task:Task) {
        let newTask = CDTask(context: context)
        newTask.id = task.id
        newTask.name = task.name
        newTask.isDone = task.isDone
        saveData()
    }
    
    func updateTask(task:Task) {
        
    }
    
    private func fetchCDTask(withId taskId:UUID) -> CDTask? {
        let fetchRequest:NSFetchRequest<CDTask> = CDTask.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", taskId as CVarArg)
        fetchRequest.fetchLimit = 1
        let fetchResult:[CDTask]? = try? context.fetch(fetchRequest)
        return fetchResult?.first
    }
    
    private func saveData() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Erreur pendant la sauvegarde CoreData : \(error.localizedDescription)")
            }
        }
    }
}

extension Task {
    init?(fromCoreDataObject coreDataObject:CDTask) {
        guard let id = coreDataObject.id,
              let name = coreDataObject.name else {
            return nil
        }
        self.id = id
        self.name = name
        self.isDone = coreDataObject.isDone
    }
}
