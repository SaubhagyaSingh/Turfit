import 'package:flutter/material.dart';
import 'package:turfit/views/widgets/Sports.dart';
import 'package:turfit/views/widgets/TurfSlider.dart';
import 'package:turfit/views/widgets/academies.dart';
import '../../widgets/NewsSlider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Wrap the scrollable content in Expanded to avoid overflow issues
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Top News',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // NewsSlider with fixed height
                    SizedBox(
                      height: 180,
                      child: NewsSlider(),
                    ),

                    SizedBox(height: 20),

                    // Turf Slider Title
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        'Available Turfs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // TurfSlider with fixed height
                    SizedBox(
                      height: 200,
                      child: TurfSlider(),
                    ),

                    SizedBox(height: 20),

                    // Academies Slider Title
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        'Sports Academies',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // AcademiesSlider with fixed height
                    SizedBox(
                      height: 180,
                      child: AcademiesSlider(),
                    ),

                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Popular Sports',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SportsGrid(),
// Add some spacing at the bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
