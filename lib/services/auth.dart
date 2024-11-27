import 'package:foodiez/models/user.dart';
import 'package:foodiez/services/client.dart';

/// Calls API `/signup` by sending email and password in body
Future<User> signupAPI(String email, String password) async {
  // send request to API and store response
  var response = await dio.post("/signup", data: {
    "email": email,
    "password": password,
  });

  // parse response from Map into User object and return it
  return User.fromJson(response.data['data']);
}

Future<User> signInAPI(String email, String password) async {
  // Send request to API and store the response
  var response = await dio.post("/signin", data: {
    "email": email,
    "password": password,
  });

  // Parse response from Map into User object and return it
  return User.fromJson(response.data['data']);
}
