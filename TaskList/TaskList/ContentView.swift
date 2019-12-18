//
//  ContentView.swift
//  TaskList
//
//  Created by Maegan Wilson on 12/17/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    @State private var taskName: String = ""
    
    var body: some View {
        HStack{
            TextField("Task Name", text: $taskName)
            Button(action: {
                self.addTask()
            }){
                Text("Add Task")
            }
        }
    }
    
    func addTask() {
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.isComplete = false
        newTask.name = taskName
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
