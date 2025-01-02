import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfit/views/screens/nav_screens/base_screen.dart';
import 'package:turfit/views/screens/nav_screens/groups_screen.dart';
import 'package:turfit/views/screens/nav_screens/profile_screen.dart';
import 'package:turfit/views/screens/nav_screens/search_screen.dart';
import 'package:turfit/views/screens/nav_screens/turfs_screen.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    base_screen(),
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
