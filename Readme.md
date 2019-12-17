This post is going to walk through how to make a task list app that stores the task in Core Data. 

This app will have the following features:

- Add a task
- Complete a task
- Delete a task
- Persist data if the app is closed

Here is what the finished app will look like

TODO: Add image

The finished app can be found in this GitHub repo:

# 1. Create a new single page iOS app

Create a new Xcode project for a single view iOS app.

Check the boxes for SwiftUI and to use CoreData

# 2. Add CoreData Entity for a task

A task entity will have the following attributes and types:

- id: UUID
- name: String
- isComplete: Bool

The `ProjectName.xcdatamodeld` should now look like the picture below.