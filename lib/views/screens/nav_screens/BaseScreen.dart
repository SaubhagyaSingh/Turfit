import 'package:flutter/material.dart';

import '../../widgets/NewsSlider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: NewsSlider(),
      ),
    );
  }
}
