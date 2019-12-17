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

The first thing we need to do is add an entity to the CoreData model. To do this, open `ProjectName.xcdatamodeld`, where `ProjectName` is what you called the project in Step 1, and click on **Add Entity** at the bottom of the window. Name the new entity `Task`.

The image below highlights where to change the name in the Inspector.

![](task-name)

A task entity will have the following attributes and types:

- id: UUID
- name: String
- isComplete: Bool

The `ProjectName.xcdatamodeld` should now look like the picture below.

![](task-attributes)