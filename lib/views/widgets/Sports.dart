import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SportsGrid extends StatelessWidget {
  final List<Map<String, String>> sports = [
    {
      "name": "Football",
      "image": "assets/icons/football.svg", // SVG image
    },
    {
      "name": "Basketball",
      "image": "assets/icons/basketball.svg",
    },
    {
      "name": "Tennis",
      "image": "assets/icons/tennis.svg",
    },
    {
      "name": "Cricket",
      "image": "assets/icons/cricket.svg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: GridView.builder(
        physics:
            NeverScrollableScrollPhysics(), // Prevents independent scrolling
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          childAspectRatio: 1, // Makes the boxes more square
        ),
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final sport = sports[index];

          return Material(
            color: Colors.transparent, // Keeps background transparent
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {
                print('${sport["name"]} tapped');
              },
              borderRadius: BorderRadius.circular(16),
              splashColor:
                  Colors.white.withOpacity(0.5), // Visible splash color
              highlightColor: Colors.white.withOpacity(0.3), // Highlight effect
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Slight transparency
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3), // Soft glow
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      sport["image"]!,
                      width: 50, // Icon size
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 12),
                    Text(
                      sport["name"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
