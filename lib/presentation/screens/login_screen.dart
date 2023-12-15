import 'package:flutter/material.dart';

import 'package:notes_keeper/utils/app_exports.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final UserViewModel _userViewModel = UserViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor = colorScheme.background;
    Color secondaryColor = colorScheme.secondary;

    return Consumer<SignUpViewModel>(
      builder: (context, viewModel, child) {
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
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/login.png',
                            width: 210,
                          ),
                          const SizedBox(height: 25),
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
                            controller: viewModel.emailController,
                            validator: FormValidators.validateEmail,
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            errorText: viewModel.emailErrorMessage,
                          ),
                          const SizedBox(height: 20),
                          TextInputField(
                            controller: viewModel.passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            errorText: viewModel.passwordErrorMessage,
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: LinkTextButton(
                              text: 'Forgot Password?',
                              fontSize: 14.0,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 12),
                          PrimaryButton(
                            buttonText: "Log In",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool result = await viewModel.loginUser();
                                if (result) {
                                  Navigator.of(context).pushNamed('/notes');
                                }
                              }
                            },
                            isLoading: viewModel.isLoading,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: secondaryColor,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: secondaryColor,
                                    thickness: 1,
                                  ),
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                              const SizedBox(width: 5),
                              LinkTextButton(
                                  text: "Sign Up",
                                  onPressed: () => Navigator.of(context)
                                      .popAndPushNamed('/signup')),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _loginUser() async {
    // String email = _emailController.text;
    // String password = _passwordController.text;

    // if (_formKey.currentState!.validate()) {
    // Perform sign-in here if validation succeeds
    // }

    // bool isUserLoggedIn = await _userViewModel.loginUser(email, password);

    // if (isUserLoggedIn) {
    // Navigator.of(context).pushNamed('/signup');
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
