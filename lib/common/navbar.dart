import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(color: Color.fromARGB(255, 30, 129, 33), Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Color.fromARGB(255, 30, 129, 33), Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                color: Color.fromARGB(255, 30, 129, 33), Icons.meeting_room),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
        elevation: 0.0,
      ),
    );
  }
}
