import 'package:bengaluru_townsquare/animation/townsquare_shimmer.dart';
import 'package:bengaluru_townsquare/firebase_options.dart';
import 'package:bengaluru_townsquare/repositories/user_repository.dart';
import 'package:bengaluru_townsquare/routes.dart';
import 'package:bengaluru_townsquare/screens/auth/auth1_welcome.dart';
import 'package:bengaluru_townsquare/screens/auth/onboarding1_name.dart';
import 'package:bengaluru_townsquare/screens/root/my_communities.dart';
import 'package:bengaluru_townsquare/theme/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Widget getScreen() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const AuthScreen();
          } else {
            return FutureBuilder<bool>(
              future: FirebaseUserRepository()
                  .isUserDataAvailable(FirebaseAuth.instance.currentUser!.uid),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == true) {
                    return const FeedScreen();
                  } else {
                    return const OnboardingNameScreen();
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          }
        } else {
          return const Center(
            child: TownsquareShimmer(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bengaluru Townsquare',
      theme: darkTheme,
      routes: routes,
      home: getScreen(),
    );
  }
}
