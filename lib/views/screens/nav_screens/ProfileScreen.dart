import 'package:flutter/material.dart';

class Profile_Screen extends StatelessWidget {
  final String name = "John Doe";
  final String email = "johndoe@example.com";
  final String phoneNumber = "+1 234 567 890";
  final String imageUrl =
      "https://www.w3schools.com/w3images/avatar2.png"; // Replace with your image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background to black
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Colors.white, // Dark purple for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centralize all content
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular image at the top
              CircleAvatar(
                radius: 80, // Radius of the circular image
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(height: 20), // Space between image and text
              // Name
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color for better contrast
                ),
              ),
              SizedBox(height: 10), // Space between name and email
              // Email
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400], // Lighter grey for email
                ),
              ),
              SizedBox(height: 10), // Space between email and phone number
              // Phone number
              Text(
                phoneNumber,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400], // Lighter grey for phone number
                ),
              ),
              SizedBox(height: 30), // Space before button
              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Action for editing profile
                },
                child: Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Dark purple button color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
