import 'package:bengaluru_townsquare/routes.dart';
import 'package:bengaluru_townsquare/screens/auth/auth1_welcome.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bengaluru Townsquare',
      theme: darkTheme,
      routes: routes,
      home: const AuthScreen(),
    );
  }
}
