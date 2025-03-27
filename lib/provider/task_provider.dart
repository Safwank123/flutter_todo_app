import 'package:flutter/material.dart';
import 'package:flutter_todo_app/hive/hive_box.dart';
import 'package:flutter_todo_app/hive/models/task_model.dart';
import 'package:hive/hive.dart';


class TaskProvider with ChangeNotifier {
  final Box<Task> _taskBox = Hive.box<Task>(HiveBoxes.taskBox);

  List<Task> get tasks => _taskBox.values.toList();

  void addTask(String title, String description) {
    _taskBox.add(Task(title: title, description: description));
    notifyListeners();
  }
void updateTask(int index, Task task) {
  _taskBox.putAt(index, task);
  notifyListeners();
}


  void deleteTask(int index) {
    _taskBox.deleteAt(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    Task task = _taskBox.getAt(index)!;
    task.isCompleted = !task.isCompleted;
    _taskBox.putAt(index, task);
    notifyListeners();
  }
}
