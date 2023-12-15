import 'package:flutter/material.dart';
import 'package:notes_keeper/utils/app_exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 80),
                  Image.asset(
                    'assets/images/productivity-light.png',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const Column(
                children: [
                  Text(
                    'Capture & Organize\n Ideas with Ease',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      "Jot down brilliant ideas, keeping track of daily tasks, or preserving important thoughts",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 133, 133, 133),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 35),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PrimaryButton(
                  buttonText: 'GET STARTED',
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('onboarding_complete', true);

                    Navigator.of(context).pushNamed('/login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
