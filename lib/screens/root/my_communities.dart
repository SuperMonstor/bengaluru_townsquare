import 'package:bengaluru_townsquare/screens/root/discover_communities.dart';
import 'package:bengaluru_townsquare/screens/root/feed_shell.dart';
import 'package:bengaluru_townsquare/screens/root/notifications.dart';
import 'package:bengaluru_townsquare/screens/root/widgets/feed_app_bar.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  static const String idScreen = 'FeedScreen';
  const FeedScreen({super.key});

  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
    FeedPage(),
    DiscoverCommunities(),
    Notifications(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeedAppBar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Friends',
          ),
        ],
      ),
    );
  }
}
