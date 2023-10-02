import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'package:sched/common/logo.dart';

final log = Logger("LoginScreen");

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              LogoWidget(subText: "Sign in to schedule"),
              RegisterForm(),
            ],
          )),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
