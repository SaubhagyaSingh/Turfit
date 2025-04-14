import 'package:flutter/material.dart';

import '../../widgets/turf_vertical_list.dart';

class TurfsScreen extends StatelessWidget {
  const TurfsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Turfs"),
        backgroundColor: Colors.black,
      ),
      body: TurfVerticalList(),
    );
  }
}
