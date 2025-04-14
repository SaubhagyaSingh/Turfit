import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../env/turf_data.dart'; // Assuming the turf data is in this file

class TurfSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0, // Adjust height as needed
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: turfServices.map((service) {
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
                      // Name and cost in the same row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            service["name"],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            service["cost"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 2), // Add spacing
                      // Timings and days in another row
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
