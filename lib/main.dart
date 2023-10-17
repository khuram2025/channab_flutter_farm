import 'package:channab_fram_flutter/HomePage.dart';
import 'package:channab_fram_flutter/app_theme.dart';  // Import the theme file
import 'package:flutter/material.dart';

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
        primaryColor: primaryColor, // Use the primary color from app_theme.dart
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(), // Set HomePage as the default route
    );
  }
}
