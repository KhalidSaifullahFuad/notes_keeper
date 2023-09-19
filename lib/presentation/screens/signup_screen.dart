import 'package:flutter/material.dart';

import 'package:notes_keeper/core/app_export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final UserViewModel _userViewModel = UserViewModel();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 2,
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: colorScheme.onPrimary,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: colorScheme.secondary,
                    child: Icon(
                      Icons.person,
                      size: 65,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: colorScheme.primary,
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: colorScheme.primary,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.grey[300],
                    hintText: 'Enter your name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.secondary, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: colorScheme.primary,
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: colorScheme.primary,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.grey[300],
                    hintText: 'Enter your email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.secondary, width: 2.0),
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
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: true,
                  cursorColor: colorScheme.primary,
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: colorScheme.primary,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.grey[300],
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.secondary, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Phone',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.phone,
                  cursorColor: colorScheme.primary,
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 50,
                    ),
                    prefixIcon: Icon(
                      Icons.phone_rounded,
                      color: colorScheme.primary,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.grey[300],
                    hintText: 'Enter your phone number',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.secondary, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide.none,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _registerUser();
                    _getAllUsers();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getAllUsers() async {
    List<User> users = await DatabaseHelper.instance.getAllUsers();
    for (User user in users) {
      print(user.name + ' ' + user.email + ' ' + user.password);
    }
  }

  void _registerUser() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill all the fields', color: Colors.red);
      return;
    }

    int result = await _userViewModel.registerUser(name, email, password);
    if (result != -1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const NotesScreen();
          },
        ),
      );
    } else {
      _showSnackBar('Email already exists!!', color: Colors.red);
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
  