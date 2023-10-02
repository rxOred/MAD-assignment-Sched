import 'package:flutter/material.dart';
import 'package:sched/common/page_heading.dart';
import 'package:sched/common/profile.dart';
import 'package:sched/screens/profile.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final isImplyLeading;

  const CustomAppBarWidget(
      {super.key, required this.title, this.isImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isImplyLeading,
      title: PageHeadingWidget(text: title), // Screen heading on the left side
      actions: <Widget>[
        ProfileIconWidget(onProfileIconPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
