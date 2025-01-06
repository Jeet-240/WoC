import 'dart:io';

List<String> todoList = [];

void viewTasks() {
  if (todoList.isEmpty) {
    print("List is Empty.");
    return;
  }
  int number = 1;
  print("\n");
  for (String tasks in todoList) {
    print("$number : $tasks");
    number++;
  }
  print("\n");
  return;
}

void addTask() {
  stdout.write("Enter the task to add: ");
  String? task = stdin.readLineSync();
  if (task != '' && task != null) {
    todoList.add(task.toString());
    print("\nThe task was added succesfully.");
  } else {
    print("Enter task properly next time.");
  }
  print("\n");
}

void removeTask() {
   if (todoList.isEmpty) {
    print("List is Empty.");
    return;
  }
  stdout.write("Enter the task number to remove: ");
  int? number = int.parse(stdin.readLineSync()!);
  if (todoList.isEmpty) {
    print("List is empty.");
  }
  number--;
  if (number >= 0 && number < todoList.length) {
    todoList.removeAt(number);
    print("Task number $number remover succesfully.");
  } else {
    print("Enter the number properly.");
  }
  print("\n");
}

void markDone() {
   if (todoList.isEmpty) {
    print("List is Empty.");
    return;
  }
  stdout.write("Enter the task number to be marked as done: ");
  int? number = int.parse(stdin.readLineSync()!);
  print(number);
  if (todoList.isEmpty) {
    print("List is empty.");
  }
  number--;
  if (number >= 0 && number <= todoList.length) {
    todoList[number] = todoList[number] + " ✅";
  } else {
    print("Enter the number properly.");
  }
  print("\n");
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

String options = """
Enter any of the following:
  1. View Tasks.
  2. Add Task.
  3. Remove Task.
  4. Mark a task as done.
  5. Exit.
  6. Clear screen.
""";

void enterView() {
  clearScreen();
  print(DateTime.now());
  print("Welcome!!");
  sleep(Duration(seconds: 3));
  clearScreen();
  for (int i = 0; i < 3; i++) {
    stdout.write('.');
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
        viewTasks();
        break;
      case '2':
        addTask();
        break;
      case '3':
        removeTask();
        break;
      case '4':
        markDone();
      case '5':
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
      case '6':
      case 'clear':
        sleep(Duration(seconds: 1));
        clearScreen();

      default:
        print("Enter number properly. [1,6].");
    }
  }
}
