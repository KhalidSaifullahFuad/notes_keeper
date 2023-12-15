import 'package:flutter/widgets.dart';

import 'package:notes_keeper/utils/app_exports.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  static const String routeName = '/home_screen';

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  bool isOnboardingSeen = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();

    // Listen to changes in user authentication state

    // final auth = Provider.of<AuthenticationRepository>(context, listen: false);
    // auth.user.listen((user) {
    //   if (user != UserModel.empty) {
    //     setState(() {
    //       isLoggedIn = true;
    //     });
    //   }

    //   // if (user == UserModel.empty) {
    //   //   Navigator.of(context).pushNamedAndRemoveUntil(
    //   //       Routes.get_started.toString(), (route) => false);
    //   // } else {
    //   //   Navigator.of(context).pushNamedAndRemoveUntil(
    //   //       Routes.notes.toString(), (route) => false);
    //   // }
  }

  void _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isOnboardingSeen = (prefs.getBool('onboarding_complete') ?? false);
    print("isOnboardingSeen: $isOnboardingSeen");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    isLoggedIn = user == UserModel.empty ? false : true;
    print("user: ${user.id}, ${user.name}, ${user.email}, ${user.password}");

    if (!isOnboardingSeen) {
      return const StartScreen();
    } else if (!isLoggedIn) {
      return const LoginScreen();
    } else {
      return const NotesScreen();
    }
  }
}
