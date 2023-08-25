import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'package:notes_keeper/core/app_exports.dart';

void main() {
  runApp(kIsWeb || kDebugMode
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
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const StartScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/get_started',
      routes: routes,
    );
  }
}
