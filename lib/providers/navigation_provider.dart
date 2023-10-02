import 'package:flutter/material.dart';
import 'package:sched/screens/create.dart';
import 'package:sched/screens/invite.dart';
import 'package:sched/screens/meetings.dart';
import 'package:sched/screens/tasks.dart';

class NavigationProvider {
  // Implement your navigation logic here, e.g., push, pop, etc.
  static void navigateToTasks(BuildContext context, String? token) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TasksScreen(token: token)));
  }

  static void navigateToCreate(BuildContext context, String? token) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CreateScreen(token: token)));
  }

  static void navigateToMeeting(BuildContext context, String? token) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MeetingScreen(token: token)));
  }

  static void navigateToInvite(BuildContext context, String type, String name,
      String desc, String date, String time) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InviteScreen(
              taskOrMeetingName: type,
              name: name,
              description: desc,
              date: date,
              time: time,
            )));
  }
}
