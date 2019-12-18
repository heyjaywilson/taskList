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

# 2. CoreData Entities and Attributes

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

## 2.2 Add a new Swift file

Now, we are adding a new swift file that will make `Task` identifiable making the List of tasks easier to call.

Add a new Swift file and call it `Task+Extensions`

In the file, add the following:

```swift

extension Task: Identifiable {
}

```

By adding the code above, the `Task` class now conforms to the `Identifiable` class.

## 2.3 Add CoreData to `ContentView.swift`

We need to add a variable that accesses our Managed Object Context in `ContentView.swift`. To do this, open `ContentView.swift` and add `@Environment(.\managedObjectContext) var context` before the `body` variable. `ContentView` should now look like this:

```swift

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
    	Text("Hello world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

### What did we do?

We declared context as an environment variable meaning that the value is going to come from the view's environment. In this case, it is going to come from `SceneDelegate.swift` on lines 23 through 27 where `context` is declared and then given to `ContentView()`.

# 3. UI Time and make it work!

We are now going to work on the UI in `ContentView.swift`.

## 3.1 Adding a `TextField`

Let's start by adding a `TextField` to the app. Change the `Text(HelloWorld)` to `TextField(title: StringProtocol, text:Binding<String>)`. `TextField` needs two properties, a `StringProtocol` and a `Binding<String>`. For the `StringProtocol`, give it a property of `"Task Name"`. When the `TextField` is empty, Task Name will appear in a light gray color.

Now, we still need a `Binding<String>`, this isn't as easy as `TextField`. We need to declare a variable for it. Before the `body` variable declaration, add `@State private var taskName: String = ""`, and then make the second property of `TextField` `$taskName`. `ContentView.swift` should now look like this:

```swift

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
	// this is the variable we added
    @State private var taskName: String = ""
    
    var body: some View {
    	// this is the TextField that we added
        TextField("Task Name", text: $taskName)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

### What did we do?

I'm going to explain the parts of `@State private var taskName: String = ""` and why we needed to do this. 

First, this is declaring a [State](https://developer.apple.com/documentation/swiftui/state) property by using the `@State` property wrapper so that `taskName` is a binding value. A State property is going to store the value in `taskName` and allow the view to watch and update when the value changes.

## 3.2 Adding the task to our CoreData

First, we need to add a button so that when the user is done typing they can then add the task to their list.

To do this, we are going to wrap `TextField` in an `HStack` and then add a `Button()`. When adding the button, the action should be `self.addTask()` and label in the button should be `Text("Add Task)`.

Here's what the code in `body` should look like now.

```swift

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

```

Now, this causes Xcode to give the error `Value of type 'ContentView' has no member 'addTask'`, so this means we have to add the function `addTask()`.

After the `body` variable, add the following:

```swift

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

```

### What did we do?

In `addTask()`, we made a new Task object and then gave the attributes of `newTask` values. Then we use the `save()` on context to add it to CoreData.

## 3.3 






















