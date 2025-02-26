import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swift_ui_into_flutter/another_os_screen.dart';
import 'package:swift_ui_into_flutter/ios_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Platform.isIOS ? const IosScreen() : const AnotherOsScreen(),
    );
  }
}
