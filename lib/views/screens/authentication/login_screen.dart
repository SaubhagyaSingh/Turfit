import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfit/controllers/auth_controller.dart';
import 'package:turfit/views/screens/authentication/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    // Getting the total height of the screen
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        // Use SingleChildScrollView to prevent overflow
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to top-left
            children: [
              Image.asset(
                "assets/images/messi.jpg",
                width: double.infinity,
                height: screenHeight * 0.45,
                fit: BoxFit
                    .cover, // This ensures the image covers the entire area
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Login Your Account",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Colors.black, // Text color set to black
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
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
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your Email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey[
                        200], // Input fields' background color (light gray)
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
              SizedBox(height: 20),
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
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey[
                        200], // Input field's background color (light gray)
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need an Account ? ',
                    style: GoogleFonts.getFont('Lato', fontSize: 15),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegistrationScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.getFont('Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.orange),
                      ))
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    await _authController.signInUsers(
                        context: context, email: email, password: password);
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.black45])),
                    child: Center(
                        child: Text(
                      "Login",
                      style: GoogleFonts.getFont('Lato',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
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
