import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SportsGrid extends StatelessWidget {
  final List<Map<String, String>> sports = [
    {
      "name": "Football",
      "image": "assets/icons/football.svg",
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
      padding: const EdgeInsets.all(30.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          childAspectRatio: 1,
        ),
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final sport = sports[index];

          return _AnimatedSportCard(
            name: sport["name"]!,
            iconPath: sport["image"]!,
            onTap: () {
              print('${sport["name"]} tapped');
            },
          );
        },
      ),
    );
  }
}

class _AnimatedSportCard extends StatefulWidget {
  final String name;
  final String iconPath;
  final VoidCallback onTap;

  const _AnimatedSportCard({
    required this.name,
    required this.iconPath,
    required this.onTap,
  });

  @override
  State<_AnimatedSportCard> createState() => _AnimatedSportCardState();
}

class _AnimatedSportCardState extends State<_AnimatedSportCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(_) {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: Duration(milliseconds: 100),
      scale: _scale,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: widget.onTap,
          onTapDown: _onTapDown,
          onTapCancel: () => setState(() => _scale = 1.0),
          onTapUp: _onTapUp,
          borderRadius: BorderRadius.circular(16),
          splashColor: Colors.deepPurple.withOpacity(0.7),
          highlightColor: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.iconPath,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
