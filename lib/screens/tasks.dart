import 'package:flutter/material.dart';
import 'package:sched/common/header.dart';
import 'package:sched/common/navbar.dart';
import 'package:sched/providers/navigation_provider.dart';
import 'package:sched/types/task.dart';

class TasksScreen extends StatefulWidget {
  final String? token;

  const TasksScreen({super.key, required this.token});
  @override
  State<StatefulWidget> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      NavigationProvider.navigateToCreate(context, widget.token);
    } else if (index == 2) {
      NavigationProvider.navigateToMeeting(context, widget.token);
    }
  }

  List<Task> tasks = [
    Task(name: 'Task 1', description: 'Description 1'),
    Task(name: 'Task 2', description: 'Description 2'),
    Task(name: 'Task 3', description: 'Description 3'),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        isImplyLeading: false,
        title: 'Tasks',
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tasks[index].name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    tasks[index].description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Handle task deletion here
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Handle task update here
                          // You can navigate to a screen for updating the task
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
