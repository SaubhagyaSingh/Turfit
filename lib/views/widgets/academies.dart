import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AcademiesSlider extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      "image": "assets/images/academy.jpg",
      "cost": "\$50",
      "timings": "9 AM - 5 PM",
      "days": "Monday - Friday",
    },
    {
      "image": "assets/images/academy.jpg",
      "cost": "\$75",
      "timings": "10 AM - 6 PM",
      "days": "Monday - Friday",
    },
    {
      "image": "assets/images/academy.jpg",
      "cost": "\$100",
      "timings": "8 AM - 4 PM",
      "days": "Monday - Friday",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0, // Adjust height as needed
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: services.map((service) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 2),
            ],
          ),
          child: Column(
            children: [
              // Image takes 60% of the container
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    service["image"],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Details take the remaining 40%
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        "Monthly Prices : ${service["cost"]}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5), // Add spacing
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text properly
                        children: [
                          Text(
                            "${service["timings"]}",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 95),
                          Text(
                            service["days"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
