import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class groups_screen extends StatelessWidget {
  const groups_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Welcome to Groups Screen",
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
