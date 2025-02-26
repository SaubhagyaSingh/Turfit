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

  String email = "";
  String fullName = "";
  String password = "";
  String confirmPassword = "";
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        print("Registering user: $email");
        await _authController.signUpUsers(
          context: context,
          email: email,
          fullName: fullName,
          password: password,
        );

        print("Registration successful, navigating to login...");
        _formKey.currentState!.reset();
        setState(() {
          _isLoading = false;
        });

        // Navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } catch (e) {
        print("Error during registration: $e");
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: ${e.toString()}")),
        );
      }
    }
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
                "assets/images/neymar2.jpg",
                width: double.infinity,
                height: screenHeight * 0.25,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Create Your Account",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                icon: "assets/icons/email.png",
              ),
              _buildTextField(
                label: "Password",
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value!.isEmpty) return "Please enter your password";
                  if (value.length < 6)
                    return "Password must be at least 6 characters";
                  return null;
                },
                icon: "assets/icons/password.png",
                isPassword: true,
                isPasswordVisible: _isPasswordVisible,
                toggleVisibility: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              _buildTextField(
                label: "Confirm Password",
                onChanged: (value) => confirmPassword = value,
                validator: (value) {
                  if (value!.isEmpty) return "Please confirm your password";
                  if (value != password) return "Passwords do not match";
                  return null;
                },
                icon: "assets/icons/password.png",
                isPassword: true,
                isPasswordVisible: _isConfirmPasswordVisible,
                toggleVisibility: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
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
    bool isPasswordVisible = false,
    VoidCallback? toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: isPassword ? !isPasswordVisible : false,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelText: 'Enter your $label',
          labelStyle: GoogleFonts.nunitoSans(
            fontSize: 14,
            color: Colors.black,
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
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
