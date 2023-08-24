import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_keeper/core/app_exports.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.white,
      //     statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
      //   ),
      //   backgroundColor: Colors.transparent,
      // ),
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
                    'assets/images/productivity.jpg',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const Column(
                children: [
                  Text(
                    'Capture & Organize\n Ideas with Ease',
                    style: TextStyle(
                      fontSize: 28,
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
                        fontSize: 20,
                        color: Color.fromARGB(255, 133, 133, 133),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 35),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: PrimaryButton(
                  'GET STARTED',
                  () {
                    Navigator.of(context).pushNamed('/get_started');
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
