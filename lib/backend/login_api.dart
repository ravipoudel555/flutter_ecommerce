import 'dart:convert';

import 'package:ecommerce_app/utility/EcommerceConfig.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  String email;
  String password;
  LoginApi(this.email, this.password);

  Future<http.Response> login() async {
    print('login ');
    var body = {"email": email, "password": password};
    Uri uri = Uri.parse(EcommerceConfig.BASE_URL + '/users/login');
    http.Response response = await http.post(
      uri,
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }
}
