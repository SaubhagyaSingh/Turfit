import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfit/views/screens/authentication/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting the total height of the screen
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView( // Use SingleChildScrollView to prevent overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to top-left
          children: [
            Image.asset(
              "assets/images/neymar2.jpg",
              width: double.infinity,
              height: screenHeight * 0.25,
              fit: BoxFit.cover, // This ensures the image covers the entire area
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Create Your Account",
                style: GoogleFonts.getFont(
                  'Lato',
                  color: Colors.black, // Text color set to black
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            SizedBox(height: 20), // Added spacing for better layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                "Full Name",
                style: GoogleFonts.getFont(
                  'Nunito Sans',
                  color: Colors.black, // Text color set to black
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200], // Input fields' background color (light gray)
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Enter your Full Name',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    color: Colors.black, // Label text color
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/user.jpeg',
                      height: 20,
                      width: 20,
                    ),
                  ),),
              ),
            ),
            SizedBox(height: 20), // Added spacing for better layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Email",
                style: GoogleFonts.getFont(
                  'Nunito Sans',
                  color: Colors.black, // Text color set to black
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200], // Input fields' background color (light gray)
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Enter your Email',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    color: Colors.black, // Label text color
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/email.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Added spacing for better layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Password",
                style: GoogleFonts.getFont(
                  'Nunito Sans',
                  color: Colors.black, // Text color set to black
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200], // Input field's background color (light gray)
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Enter your Password',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    color: Colors.black, // Label text color
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/password.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(Icons.visibility, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20), // Added spacing for better layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Confirm Password",
                style: GoogleFonts.getFont(
                  'Nunito Sans',
                  color: Colors.black, // Text color set to black
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200], // Input field's background color (light gray)
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Confirm your Password',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    color: Colors.black, // Label text color
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/password.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(Icons.visibility, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20), // Added spacing for better layout

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an Account ? ', style: GoogleFonts.getFont('Lato', fontSize: 15),),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      },),);
                    },
                    child: Text('Sign In', style: GoogleFonts.getFont('Lato', fontWeight: FontWeight.bold, fontSize: 15, color: Colors.orange),))
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(colors: [Colors.black, Colors.black45])
                ),
                child: Center(child: Text("Register", style: GoogleFonts.getFont('Lato', fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
