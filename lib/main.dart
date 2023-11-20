import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:notes_keeper/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'package:notes_keeper/utils/app_exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(kIsWeb
      ? DevicePreview(
          enabled: true,
          builder: (context) => const MyApp(),
        )
      : const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: (isDark
            ? darkTheme.colorScheme.background
            : lightTheme.colorScheme.background),
        statusBarIconBrightness: (isDark ? Brightness.light : Brightness.dark),
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(
            AuthenticationRepository(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => NotesViewModel()),
      ],
      child: MaterialApp(
        title: 'Note App',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const StartScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/get_started',
        routes: routes,
      ),
    );
  }
}
