import 'package:bengaluru_townsquare/firebase_options.dart';
import 'package:bengaluru_townsquare/routes.dart';
import 'package:bengaluru_townsquare/screens/auth/auth1_welcome.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Firebase stuff
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Fix portrait mode
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
