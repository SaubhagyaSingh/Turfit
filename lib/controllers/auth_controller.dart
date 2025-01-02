import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfit/global_variables.dart';
import 'package:turfit/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:turfit/services/manage_http_response.dart';
import 'package:turfit/views/screens/authentication/login_screen.dart';
import 'package:turfit/views/screens/home_screen.dart';

class AuthController {
  Future<void> signUpUsers({
    required BuildContext context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password,
          token: '');
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            showSnackBar(context, "Your Account has been created for you!");
          });
    } catch (e) {
      print("Error:$e");
    }
  }

  ///sign in users function

  Future<void> signInUsers(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode(
            {'email': email, 'password': password},
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      //handle response
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => home_screen()),
                (route) => false);
            showSnackBar(context, "Logged in Successfully");
          });
    } catch (e) {
      print("Error: $e");
    }
  }
}
