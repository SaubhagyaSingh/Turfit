import 'package:flutter/material.dart';
import 'package:turfit/views/screens/nav_screens/BaseScreen.dart';
import 'package:turfit/views/screens/nav_screens/GroupsScreen.dart';
import 'package:turfit/views/screens/nav_screens/ProfileScreen.dart';
import 'package:turfit/views/screens/nav_screens/SearchScreen.dart';
import 'package:turfit/views/screens/nav_screens/TurfsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    BaseScreen(),
    search_screen(),
    turfs_screen(),
    groups_screen(),
    profile_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/home.png"), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/search.png"), label: "Search"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/turfs.png"), label: "Turfs"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/group.png"), label: "Groups"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/user.png"), label: "Profile"),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      body: _pages[_pageIndex],
    );
  }
}
