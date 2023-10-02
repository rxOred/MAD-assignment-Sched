import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:sched/common/logo.dart';

final log = Logger("LoginScreen");

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              LogoWidget(subText: "Sign in to schedule"),
              LoginForm(),
            ],
          )),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Replace this with your actual login logic
      String username = _usernameController.text;
      String password = _passwordController.text;
      print('Username: $username, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle googleFontStyle = GoogleFonts.poppins(
      fontSize: 16.0,
      height: 1.0,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 250, 10.0, 10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 25.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                ),
              ),
              obscureText: true, // Mask the password
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 60.0),
            IconButton(
              iconSize: 50,
              color: Theme.of(context).primaryColor,
              onPressed: _submitForm,
              icon: const Icon(
                Icons.arrow_forward,
              ),
            ),
            const SizedBox(height: 30.0),
            TextButton(
              onPressed: _submitForm,
              child: const Text('Sign up instead'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController controller;
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      color: Colors.white,
      child: Stack(
        children: [
          const LogoWidget(subText: "Sign in to schedule"),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  const TextLineField(text: "username"),
                  TextField(
                    controller: controller,
                    onSubmitted: (String value) {
                      setState(() {
                        username = controller.text;
                      });
                    },
                  )
                ],
              )),
          const Positioned(
              // group54mm (6:61)
              left: 46,
              top: 380,
              child: TextLineField(text: "password")),
        ],
      ),
    );
  }
/*
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => email = value,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => password = value,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
  */
}
*/