import 'package:flutter/material.dart';

class ProfileIconWidget extends StatefulWidget {
  final VoidCallback onProfileIconPressed;

  const ProfileIconWidget({super.key, required this.onProfileIconPressed});
  @override
  State<StatefulWidget> createState() => _ProfileIconWidgetState();
}

class _ProfileIconWidgetState extends State<ProfileIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: IconButton(
        icon: const Icon(Icons.person), // Profile icon
        onPressed: widget.onProfileIconPressed,
      ),
    );
  }
}
