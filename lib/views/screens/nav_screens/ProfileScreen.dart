import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Welcome to Base Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
