import 'package:flutter/material.dart';

import 'package:notes_keeper/utils/app_exports.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Consumer<SignUpViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: colorScheme.primary,
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: colorScheme.background,
          body: SafeArea(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/signup.png',
                          width: 210,
                        ),
                        const SizedBox(height: 25),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextInputField(
                          controller: viewModel.nameController,
                          validator: FormValidators.validateName,
                          hintText: "Full Name",
                          prefixIcon: Icons.person_outline_rounded,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 20),
                        TextInputField(
                          controller: viewModel.emailController,
                          validator: FormValidators.validateEmail,
                          hintText: "Email",
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          errorText: viewModel.emailErrorMessage,
                        ),
                        const SizedBox(height: 20),
                        TextInputField(
                          controller: viewModel.passwordController,
                          validator: FormValidators.validatePassword,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline_rounded,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          errorText: viewModel.passwordErrorMessage,
                        ),
                        const SizedBox(height: 20),
                        TextInputField(
                          controller: viewModel.phoneController,
                          validator: FormValidators.validatePhone,
                          hintText: "Phone",
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          buttonText: "Sign Up",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var context = this.context;
                              bool isUserRegistered =
                                  await viewModel.registerUser();
                              if (isUserRegistered && context.mounted) {
                                Navigator.of(context).pushNamed('/notes');
                              }
                            }
                          },
                          isLoading: viewModel.isLoading,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: colorScheme.onBackground,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            LinkTextButton(
                              text: "Log In",
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/notes'),
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
        );
      },
    );
  }

  void _getAllUsers() async {
    // List<User> users = await DatabaseHelper.instance.getAllUsers();
    // for (User user in users) {
    //   print(user.name + ' ' + user.email + ' ' + user.password);
    // }
  }

  void _registerUser(viewModel) async {
    // String name = viewModel.nameController.text;
    // String email = viewModel.emailController.text;
    // String password = viewModel.passwordController.text;

    // if (_formKey.currentState!.validate()) {

    //   _formKey.currentState!.save();
    //   _formKey.currentState!.reset();
    //   await viewModel.registerUser(name, email, password);
    // }

    // int result = await _userViewModel.registerUser(name, email, password);
    // if (result != -1) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return const NotesScreen();
    //     },
    //   ),
    // );
    // } else {
    //   _showSnackBar('Email already exists!!', color: Colors.red);
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
