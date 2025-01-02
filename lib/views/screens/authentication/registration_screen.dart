import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfit/controllers/auth_controller.dart';
import 'package:turfit/views/screens/authentication/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String fullName;
  late String password;
  late String confirmPassword;
  bool _isLoading = false;

  Future<void> registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _authController
          .signUpUsers(
        context: context,
        email: email,
        fullName: fullName,
        password: password,
      )
          .whenComplete(() {
        _formKey.currentState!.reset();
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Getting the total height of the screen
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        // Use SingleChildScrollView to prevent overflow
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to top-left
            children: [
              Image.asset(
                "assets/images/neymar2.jpg",
                width: double.infinity,
                height: screenHeight * 0.25,
                fit: BoxFit.cover, // Ensures the image covers the entire area
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Create Your Account",
                  style: GoogleFonts.lato(
                    color: Colors.black, // Text color set to black
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              SizedBox(height: 10), // Added spacing for better layout
              _buildTextField(
                label: "Full Name",
                onChanged: (value) => fullName = value,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your full name" : null,
                icon: "assets/icons/user.jpeg",
              ),
              _buildTextField(
                label: "Email",
                onChanged: (value) => email = value,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your email" : null,
                icon: "assets/icons/email.png",
              ),
              _buildTextField(
                label: "Password",
                onChanged: (value) => password = value,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your password" : null,
                icon: "assets/icons/password.png",
                isPassword: true,
              ),
              _buildTextField(
                label: "Confirm Password",
                onChanged: (value) => confirmPassword = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please confirm your password";
                  } else if (value != password) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                icon: "assets/icons/password.png",
                isPassword: true,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an Account? ',
                    style: GoogleFonts.lato(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: () async => registerUser(context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [Colors.black, Colors.black45],
                        ),
                      ),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                "Register",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    required String icon,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: isPassword,
        decoration: InputDecoration(
          fillColor: Colors.grey[200], // Input fields' background color
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelText: 'Enter your $label',
          labelStyle: GoogleFonts.nunitoSans(
            fontSize: 14,
            color: Colors.black, // Label text color
            letterSpacing: 0.1,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icon,
              height: 20,
              width: 20,
            ),
          ),
          suffixIcon:
              isPassword ? Icon(Icons.visibility, color: Colors.grey) : null,
        ),
      ),
    );
  }
}
