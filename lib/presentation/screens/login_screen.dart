import 'package:flutter/material.dart';

import 'package:notes_keeper/core/app_exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final UserViewModel _userViewModel = UserViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  void _clearErrors() {
    _emailError = null;
    _passwordError = null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _clearErrors();
      return 'Please enter your email';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      _clearErrors();
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor = colorScheme.background;
    Color secondaryColor = colorScheme.secondary;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ScaffoldMessenger(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/login.png',
                        width: 200,
                        height: 250,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextInputField(
                        controller: _emailController,
                        validator: _validateEmail,
                        hintText: 'Email',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        errorText: _emailError,
                        onChanged: (_) =>
                            {_clearErrors(), _emailError = "TEst"},
                      ),
                      const SizedBox(height: 20),
                      TextInputField(
                        controller: _passwordController,
                        validator: _validatePassword,
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        errorText: _passwordError,
                        onChanged: (_) => _clearErrors(),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: LinkTextButton(
                          text: 'Forgot Password?',
                          fontSize: 14.0,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        buttonText: "Log In",
                        onPressed: () {
                          _loginUser();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          children: [
                            Expanded(child: Divider(color: secondaryColor)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: secondaryColor),
                            ),
                          ],
                        ),
                      ),
                      LoginWithGoogleButton(
                        buttonText: "Log In with Google",
                        onPressed: () {},
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          LinkTextButton(
                            text: "Sign Up",
                            onPressed: () {},
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      // Perform sign-in here if validation succeeds
    }

    // bool isUserLoggedIn = await _userViewModel.loginUser(email, password);

    // if (isUserLoggedIn) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return NotesScreen();
    //       },
    //     ),
    //   );
    // } else {
    //   _showSnackBar('Invalid email or password', color: Colors.red);
    // }
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
