import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:io';

Future<List<Contact>> fetchContacts() async {
  try {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    return contacts.toList();
  } catch (e) {
    throw e;
  }
}

class InviteScreen extends StatefulWidget {
  final String taskOrMeetingName;
  final String name;
  final String description;
  final String date;
  final String time;

  const InviteScreen(
      {super.key,
      required this.taskOrMeetingName,
      required this.name,
      required this.description,
      required this.date,
      required this.time});

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  List<Contact> allContacts = [];
  List<Contact> recentContacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts().then((contacts) {
      setState(() {
        allContacts = contacts;
        // Filter recent contacts based on your logic, e.g., last contacted within a week
        recentContacts = allContacts.where((contact) {
          return contact.emails?.isNotEmpty ==
              true; // Adjust the condition as needed
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskOrMeetingName),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Handle profile icon press here
              print('Profile icon pressed');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent Contacts',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentContacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recentContacts[index].displayName ?? ''),
                  // Customize the ListTile as needed, e.g., add a checkbox
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All Contacts',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allContacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allContacts[index].displayName ?? ''),
                  // Customize the ListTile as needed, e.g., add a checkbox
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
