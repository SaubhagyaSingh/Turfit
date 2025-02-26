import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfit/controllers/auth_controller.dart';
import 'package:turfit/views/screens/authentication/registration_screen.dart';
import 'package:turfit/views/screens/nav_screens/BaseScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  String email = '';
  String password = '';
  bool isLoading = false;
  bool isPasswordVisible = false; // Toggle for password visibility

  void loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await _authController
        .signInUsers(context: context, email: email, password: password)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseScreen()),
      );
      print("Login Error: $error"); // Debugging log
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/messi.jpg",
                width: double.infinity,
                height: screenHeight * 0.45,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Login Your Account",
                  style: GoogleFonts.lato(
                    color: Colors.black,
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
                  style: GoogleFonts.nunitoSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: 'Enter your Email',
                    labelStyle: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: Colors.black,
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
                  style: GoogleFonts.nunitoSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: !isPasswordVisible, // Hide/Show password
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: 'Enter your Password',
                    labelStyle: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: Colors.black,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need an Account ? ',
                    style: GoogleFonts.lato(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: loginUser,
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
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}
