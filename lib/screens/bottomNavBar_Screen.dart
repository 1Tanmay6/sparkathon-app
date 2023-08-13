import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

import 'video_feed_Screen.dart';
import 'Explore_Screen.dart';
import 'chat_home_screen.dart';
import 'Profile_Screen.dart';
import '../providers/content_provider.dart';
import '../models/Video.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const routeName = '/bottomNavBar';
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  bool _isvideoscreenopened = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      setState(() {
        _isvideoscreenopened = true;
      });
    } else {
      setState(() {
        _isvideoscreenopened = false;
      });
    }
  }

  List<String> list = [];
  List list_all = [];
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    list = Provider.of<ContentProvider>(context).videoUrls;
    list_all = Provider.of<ContentProvider>(context).list;

    final List<Widget> _widgetOptions = <Widget>[
      VideoFeedScreen(
        content: list_all,
        contentSize: list.length, // Pass in the number of pages
        swipeThreshold: 0.2,
        swipeVelocityThreshold: 1000,
        animationDuration: const Duration(milliseconds: 300),
        videoUrlBuilder: (int index) {
          // Return the URL of the video for each page
          return list[index];
        },
      ),
      const ExploreScreen(),
      const ChatHomeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.primary,
        fixedColor:
            _isvideoscreenopened ? colorScheme.onPrimary : colorScheme.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: _isvideoscreenopened
                ? colorScheme.primary
                : colorScheme.onPrimary,
            icon: Icon(
                _selectedIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
                color: _isvideoscreenopened
                    ? colorScheme.onPrimary
                    : colorScheme.primary),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: _isvideoscreenopened
                ? colorScheme.primary
                : colorScheme.onPrimary,
            icon: Icon(
                _selectedIndex == 1 ? Icons.explore : Icons.explore_outlined,
                color: _isvideoscreenopened
                    ? colorScheme.onPrimary
                    : colorScheme.primary),
            label: 'Exlpore',
          ),
          BottomNavigationBarItem(
            backgroundColor: _isvideoscreenopened
                ? colorScheme.primary
                : colorScheme.onPrimary,
            icon: Icon(
                _selectedIndex == 2 ? Icons.message : Icons.message_outlined,
                color: _isvideoscreenopened
                    ? colorScheme.onPrimary
                    : colorScheme.primary),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            backgroundColor: _isvideoscreenopened
                ? colorScheme.primary
                : colorScheme.onPrimary,
            icon: Icon(
                _selectedIndex == 3 ? Icons.person_2 : Icons.person_2_outlined,
                color: _isvideoscreenopened
                    ? colorScheme.onPrimary
                    : colorScheme.primary),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
