import 'dart:convert';

import 'package:ecommerce_app/utility/EcommerceConfig.dart';
import 'package:http/http.dart' as http;

class SignupApi {
  SignupApi(
      {required this.citizenshipNo,
      required this.email,
      required this.password});
  String citizenshipNo;
  String email;
  String password;

  Future<http.Response> signup() async {
    var body = {
      "citizenshipNo": citizenshipNo,
      "email": email,
      "password": password
    };
    print(body);
    Uri uri = Uri.parse(EcommerceConfig.BASE_URL + '/users/signup');
    http.Response response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
}
