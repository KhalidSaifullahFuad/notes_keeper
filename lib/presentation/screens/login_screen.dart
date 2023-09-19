import 'package:flutter/material.dart';

import 'package:notes_keeper/core/app_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserViewModel _userViewModel = UserViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color primaryColor = colorScheme.primary;
    Color backgroundColor = colorScheme.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ScaffoldMessenger(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: 150,
                height: 150,
              ),
              const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 50,
                  ),
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: primaryColor,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  fillColor: Colors.black54,
                  hintText: "example@email.com",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: primaryColor, width: 2.0)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                textAlignVertical: TextAlignVertical.center,
                obscureText: true,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 50,
                  ),
                  prefixIcon: Icon(Icons.lock_rounded, color: primaryColor),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  fillColor: Colors.black54,
                  hintText: "password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color.fromRGBO(21, 101, 192, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide.none),
                  elevation: 0,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _loginUser();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                label: const Text(
                  'Login with Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 20,
                  width: 20,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color.fromARGB(221, 212, 212, 212),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    // Collect user login information
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill all the fields', color: Colors.red);
      return;
    }

    bool isUserLoggedIn = await _userViewModel.loginUser(email, password);

    if (isUserLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return NotesScreen();
          },
        ),
      );
    } else {
      _showSnackBar('Invalid email or password', color: Colors.red);
    }
  }

  void _showSnackBar(String message, {Color color = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
