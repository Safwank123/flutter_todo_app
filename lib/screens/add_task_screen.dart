import 'package:flutter/material.dart';
import 'package:flutter_todo_app/provider/task_provider.dart';
import 'package:provider/provider.dart';


class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           TextField(
  controller: titleController,
  decoration: InputDecoration(
   hintText: "Enter a title",
    hintStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    prefixIcon: Icon(Icons.title, color: Colors.blue), 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), 
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2,
      ),
    ),
    filled: true,
    fillColor: Colors.grey[100], 
  ),
  style: TextStyle(fontSize: 16),
),

            SizedBox(height: 10),
           TextField(
  controller: descController,
  maxLines: 3, 
  decoration: InputDecoration(
    hintText: "Enter your description",
    hintStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    prefixIcon: Icon(Icons.description, color: Colors.blue),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), 
      borderSide: BorderSide(
        color: Colors.blue, 
        width: 1.5, 
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.blueAccent, 
        width: 2, 
      ),
    ),
    filled: true,
    fillColor: Colors.grey[100], 
  ),
  style: TextStyle(fontSize: 16),
),

            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    if (titleController.text.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        titleController.text,
        descController.text,
      );
      Navigator.pop(context);
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24), 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), 
    ),
    elevation: 5, 
  ),
  child: Text(
    "Add Task",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white, 
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
