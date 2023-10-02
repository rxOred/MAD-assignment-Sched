import 'package:flutter/material.dart';
import 'package:sched/common/header.dart';
import 'package:sched/common/navbar.dart';
import 'package:sched/providers/navigation_provider.dart';
import 'package:sched/types/meeting.dart';

class MeetingScreen extends StatefulWidget {
  final String? token;

  const MeetingScreen({super.key, required this.token});
  @override
  State<StatefulWidget> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      NavigationProvider.navigateToTasks(context, widget.token);
    } else if (index == 1) {
      NavigationProvider.navigateToCreate(context, widget.token);
    }
  }

  List<Meeting> meetings = [
    Meeting(name: 'Meeting 1', description: 'Description 1'),
    Meeting(name: 'Meeting 2', description: 'Description 2'),
    Meeting(name: 'Meeting 3', description: 'Description 3'),
    // Add more meetings as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        isImplyLeading: false,
        title: 'Meetings',
      ),
      body: ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    meetings[index].name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    meetings[index].description,
                    style: TextStyle(
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
                          // Handle meeting deletion here
                          setState(() {
                            meetings.removeAt(index);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Handle meeting update here
                          // You can navigate to a screen for updating the meeting
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
