//
//  CoreDataHelper.swift
//  TaskList
//
//  Created by Maegan Wilson on 1/19/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataHelper{
  func addTask(_ taskName: String, context: NSManagedObjectContext){
    let newTask = Task(context: context)
    newTask.id = UUID()
    newTask.isComplete = false
    newTask.name = taskName
    newTask.dateAdded = Date()
    
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
  
  func updateTask(_ task: Task, context: NSManagedObjectContext){
    let isComplete = true
    let taskID = task.id! as NSUUID
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Task")
    fetchRequest.predicate = NSPredicate(format: "id == %@", taskID as CVarArg)
    fetchRequest.fetchLimit = 1
    do {
      let test = try context.fetch(fetchRequest)
      let taskUpdate = test[0] as! NSManagedObject
      taskUpdate.setValue(isComplete, forKey: "isComplete")
    } catch {
      print(error)
    }
  }
}
