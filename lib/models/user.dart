import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.state,
      required this.city,
      required this.locality,
      required this.password,
      required this.token});

//serialisation: converting user object to a map.

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'city': city,
      'locality': locality,
      'password': password,
      'token': token,
    };
  }

//converting map to a json string.
  String toJson() => jsonEncode(toMap());

  // the factory constructor takes a Map (usually obtained from a json object and coverts it
  //into a user object. if a field is not present, it defaults to an empty string.

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
      token: map['token'] as String? ?? "",
    );
  }

//from json: this factory constructor takes json string,and decodes into a Map<String,dynamic>
// and then uses fromMap to convert that map into an User object.

  factory User.fromJson(String source) =>
      User.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
