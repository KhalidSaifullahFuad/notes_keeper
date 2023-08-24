import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'package:notes_keeper/core/app_exports.dart';

void main() {
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
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          background: Colors.white,
          primary: const Color(0xFF3534C2),
          secondary: Colors.grey.shade300,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          // Color(0xFFEBEBEB),
        ),
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   colorScheme: ColorScheme.dark(
      //     background: Colors.black,
      //     primary: Colors.grey.shade900,
      //     secondary: Colors.grey.shade800,
      //     onPrimary: Colors.white,
      //     onSecondary: Colors.grey.shade50,
      //   ),
      // ),
      home: const StartScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/get_started',
      routes: routes,
    );
  }
}
