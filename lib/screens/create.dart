import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sched/common/header.dart';
import 'package:sched/common/navbar.dart';
import 'package:sched/providers/navigation_provider.dart';
import 'package:sched/screens/invite.dart';

class CreateScreen extends StatefulWidget {
  final String? token;

  const CreateScreen({super.key, required this.token});
  @override
  State<StatefulWidget> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  int _selectedIndex = 1;
  String selectedType = 'Task'; // Default selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      NavigationProvider.navigateToTasks(context, widget.token);
    } else if (index == 2) {
      NavigationProvider.navigateToMeeting(context, widget.token);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        isImplyLeading: false,
        title: 'Create',
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedType = 'Task';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == 'Task'
                          ? const Color.fromARGB(255, 13, 103, 16)
                          : Theme.of(context).canvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Task',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedType = 'Meeting';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedType == 'Meeting'
                          ? const Color.fromARGB(255, 13, 103, 16)
                          : Theme.of(context).canvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Meeting',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 48.0),
            Text(
              'Selected Type: $selectedType',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none, // Remove border color
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none, // Remove border color
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none, // Remove border color
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none, // Remove border color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            IconButton(
              iconSize: 50,
              color: Theme.of(context).primaryColor,
              onPressed: _onNextPressed,
              icon: const Icon(
                Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _onNextPressed() {
    String name = _nameController.text;
    String descr = _descriptionController.text;
    String date = _dateController.text;
    String time = _timeController.text;
    print(
        "name $name, desc $descr, date $date, time $time,  type $selectedType");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InviteScreen(
              taskOrMeetingName: selectedType,
              name: name,
              description: descr,
              date: date,
              time: time)),
    );
  }
}
