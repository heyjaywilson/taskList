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

![picture of naming task](https://github.com/maeganjwilson/taskList/blob/master/images/task-name.png?raw=true)

## 2.1 Adding attributes to the Task Entity

Next, we need the `Task` entity to have attributes to stare the following information:

- id: used as a unique identifier for each task
- name: what the user will call the task
- isComplete: defines whether or not a task is completed

To add attributes to `Task`, click the `+` in the Attributes section and give the attribute a name and type. The GIF below shows how to do this.

![GIF of steps above](https://github.com/maeganjwilson/taskList/blob/master/images/task-attribute.gif?raw=true)

This table describes each attribute and the type associated with the attribute.

| Attribute | Type |
| --------- | ---- |
| id | UUID |
| name | String |
| isComplete | Bool |

The `ProjectName.xcdatamodeld` should now look like the picture below.

![Picture of Attributes Finished](https://raw.githubusercontent.com/maeganjwilson/taskList/master/images/task-attributes.png)