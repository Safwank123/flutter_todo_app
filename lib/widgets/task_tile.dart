import 'package:flutter/material.dart';
import 'package:flutter_todo_app/hive/models/task_model.dart';
import 'package:flutter_todo_app/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final int index;

  const TaskTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.tasks[index];

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
           
          ),
        ),
        subtitle: Text(task.description),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            taskProvider.toggleTaskStatus(index);
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                _showEditDialog(context, taskProvider, index);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteDialog(context, taskProvider, index);
              },
            ),
          ],
        ),
      ),
    );
  }


  void _showEditDialog(BuildContext context, TaskProvider taskProvider, int index) {
    TextEditingController titleController = TextEditingController(text: taskProvider.tasks[index].title);
    TextEditingController descriptionController = TextEditingController(text: taskProvider.tasks[index].description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                taskProvider.updateTask(
  index,
  Task(
    title: titleController.text,
    description: descriptionController.text,
  ),
);

                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  
  void _showDeleteDialog(BuildContext context, TaskProvider taskProvider, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Task"),
          content: Text("Are you sure you want to delete this task?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                taskProvider.deleteTask(index);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
