import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/provider/task_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "To-Do App",
            style: GoogleFonts.bebasNeue(
              color: Colors.redAccent,
              fontSize:35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
             
              Brightness currentBrightness = Theme.of(context).brightness;
              ThemeMode newThemeMode =
                  currentBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
              MyApp.of(context)?.setThemeMode(newThemeMode);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(index: index);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 160),
        child: FloatingActionButton(
          onPressed:  () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          ),
          backgroundColor: Colors.transparent, 
         
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              width: 56,
              height: 56, 
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            colors: [Colors.pink, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
                  ],
              ),
              child: Icon(Icons.add, size: 30, color: Colors.white),
            ),
          ),
        ),
      ),

    );
  }
}
