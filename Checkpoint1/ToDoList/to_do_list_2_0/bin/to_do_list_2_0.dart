import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

Map<String, bool> toDoList = {};
List<String> taskList = [];

//To paint the tasks which are done.
AnsiPen done = AnsiPen()
  ..green()
  ..rgb(r: 255, g: 255, b: 255, bg: true);

//To paint the tasks which are not done.
AnsiPen left = AnsiPen()
  ..red()
  ..rgb(r: 255, g: 255, b: 255, bg: true);

//To paint the error or anamoly
AnsiPen err = AnsiPen()
  ..yellow()
  ..red(bg: true);

//The option string which will be used to display in the main code.
String options = """
Enter any of the following:
  1. View All Tasks.
  2. Add Task.
  3. View Marked as Done Tasks
  4. View Pending Tasks
  5. Remove Task.
  6. Mark a task as done.
  7. Search Task.
  8. Exit.
  9. Clear screen.
""";

void printDoneTasks() {
  if (toDoList.isEmpty) {
    print(err("List is Empty."));
    return;
  }
  int idx = 1;
  toDoList.forEach((key, value) {
    if (value) {
      print(done("${idx}: ${key + " ✅ "}"));
      idx++;
    }
  });
  if (idx == 1) print('No Tasks are marked done.');
  print("\n");
}

void printLeftTasks() {
  if (toDoList.isEmpty) {
    print(err("List is Empty.  "));
    return;
  }
  int idx = 1;
  toDoList.forEach((key, value) {
    if (!value) {
      print(left("${idx}: ${key + " 🕒  "}"));
      idx++;
    }
  });
  if (idx == 1) print('No Tasks are Left!!!.');
  print("\n");
}

void printAllTasks() {
  if (toDoList.isEmpty) {
    print(err("List is Empty."));
    return;
  }
  AnsiPen p;
  int idx = 1;
  String emoji = " ✅ ";
  for (MapEntry task in toDoList.entries) {
    if (task.value) {
      p = done;
      emoji = " ✅ ";
    } else {
      p = left;
      emoji = " 🕒 ";
    }
    print(p("${idx} : ${task.key + emoji}"));
    idx++;
  }
  print("\n");
}

void searchTask() {
  stdout.write("Enter the task to search: ");
  String? find = stdin.readLineSync();
  if (find != null && find.isNotEmpty) {
    print(find.toString().substring(0, find.length));
    if (toDoList.containsKey(find.toString().substring(0, find.length))) {
      print("Task Found!!");
      bool isCompleted = toDoList[find.toString()]!;
      AnsiPen p = isCompleted ? done : left;
      print(
          p("Task: $find (Status: ${isCompleted ? 'Completed' : 'Pending'})"));
    } else {
      print(err("Task was not found."));
    }
  } else {
    print(err("Please enter a valid task name."));
  }
  print("\n");
}

void addTask() {
  stdout.write("Enter the task to add: ");
  String? task = stdin.readLineSync();
  if (task.toString() != "" && task.toString().isNotEmpty) {
    markAsLeft(task.toString());
    print("\n");
  } else {
    print(err("Enter correctly."));
  }
  print("\n");
}

void markAsDone() {
  stdout.write("Enter the task number to marked done: ");
  int? number = int.parse(stdin.readLineSync()!);
  if (number < 0) {
    print(err("Enter the number properly."));
  } else {
    toDoList.remove(taskList[number - 1]);
    String temp = taskList[number - 1];
    toDoList.remove(temp);

    toDoList[temp] = true;
  }
  print("\n");
}

void markAsLeft(String task) {
  taskList.add(task);
  toDoList[task] = false;
}

void removeTask() {
  if (toDoList.isEmpty) {
    print(err("List is Empty."));
    return;
  }
  stdout.write("Enter the task number to remove: ");
  int? number = int.parse(stdin.readLineSync()!);
  if (number >= 0 && number < taskList.length) {
    String taskRemoved = taskList[number - 1];
    taskList.removeAt(number - 1);
    toDoList.remove(taskRemoved);
    print("Task number $number remover succesfully.");
  } else {
    print("Enter the number properly.");
  }
  print("\n");
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void enterView() {
  clearScreen();
  AnsiPen pen = AnsiPen()
    ..cyan()
    ..white(bg: true);
  print(pen(DateTime.now()));
  print(pen("Welcome!!"));
  sleep(Duration(seconds: 3));
  clearScreen();
  for (int i = 0; i < 3; i++) {
    pen = AnsiPen()
      ..black()
      ..white(bg: true);
    stdout.write(pen('.'));
    sleep(Duration(seconds: 1));
  }
  clearScreen();
}

void main() {
  enterView();

  while (true) {
    print(options);
    stdout.write("Enter your choice: ");
    String? reply = stdin.readLineSync();

    switch (reply) {
      case '1':
        printAllTasks();
        break;
      case '2':
        addTask();
        break;
      case '3':
        printDoneTasks();
        break;
      case '4':
        printLeftTasks();
        break;
      case '5':
        removeTask();
        break;
      case '6':
        markAsDone();
        break;
      case '7':
        searchTask();
        break;
      case '8':
        {
          print("\nExiting.");
          sleep(Duration(seconds: 5));
          clearScreen();
          for (int i = 0; i < 3; i++) {
            stdout.write('.');
            sleep(Duration(seconds: 1));
          }
          print("\nBye!!");
          sleep(Duration(seconds: 3));
          return;
        }
      case '9':
      case 'clear':
        sleep(Duration(seconds: 1));
        clearScreen();

      default:
        print("Enter number properly. [1,6].");
    }
  }
}
