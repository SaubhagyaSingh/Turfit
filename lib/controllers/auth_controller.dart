import 'package:flutter/cupertino.dart';
import 'package:turfit/global_variables.dart';
import 'package:turfit/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:turfit/services/manage_http_response.dart';

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
          password: password);
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Your Account has been created for you!");
          });
    } catch (e) {}
  }
}
