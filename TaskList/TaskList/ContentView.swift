//
//  ContentView.swift
//  TaskList
//
//  Created by Maegan Wilson on 12/17/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI
import CoreData

struct TaskRow: View {
  var task: Task
  
  var body: some View {
    Text(task.name ?? "No name given")
  }
}

struct ContentView: View {
  @Environment(\.managedObjectContext) var context
  
  @FetchRequest(
    entity: Task.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath: \Task.dateAdded, ascending: false)],
    predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
  ) var notCompletedTasks: FetchedResults<Task>
  
  @State private var taskName: String = ""
  
  let core_data_helper = CoreDataHelper()
  
  var body: some View {
    VStack {
      HStack{
        TextField("Task Name", text: $taskName)
        Button(action: {
          self.core_data_helper.addTask(self.taskName, context: self.context)
        }){
          Text("Add Task")
        }
      }.padding(.all)
      List {
        ForEach(notCompletedTasks){ task in
          Button(action: {
            self.core_data_helper.updateTask(task, context: self.context)
          }){
            TaskRow(task: task)
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
