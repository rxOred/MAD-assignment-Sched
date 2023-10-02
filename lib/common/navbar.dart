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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(color: Theme.of(context).primaryColor, Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Theme.of(context).primaryColor, Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(color: Theme.of(context).primaryColor, Icons.meeting_room),
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
