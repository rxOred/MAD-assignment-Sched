import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:sched/providers/theme_provider.dart'; // Replace with the actual file where ThemeProvider is defined

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context,
        listen: false); // Access the theme provider

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: <Widget>[
            IconButton(
              // ignore: prefer_const_constructors
              icon: Icon(Icons
                  .nightlight_round), // Use an appropriate icon for dark mode
              onPressed: () {
                // Toggle theme when the button is pressed
                themeProvider.toggleTheme();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(
                    'assets/profile_picture.png'), // Replace with your image
              ),
              const SizedBox(height: 50.0),
              const Text(
                'Username: JohnDoe', // Replace with user's username
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Email: john.doe@example.com', // Replace with user's email
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                '077777777777', // Replace with user's email
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // Handle password change button press
                  // You can navigate to a screen for changing the password
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
