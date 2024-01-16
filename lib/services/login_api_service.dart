import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:postapi/model/login_response_model.dart';

class LoginApiService {
  static Future<List<LoginModel>> getData() async {
    List<LoginModel> getLoginData = [];
    final response = await http.get(
      Uri.parse('https://gorest.co.in/public/v2/users'),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization":
            "Bearer c9deacfd00d58aef0219b783eebff9cbac46821034ee07d465a2424b341c7725"
      },
    );
    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          getLoginData = loginModelFromJson(response.body);
        }
      }
    } catch (e) {
      log("Failed to Load $e");
    }
    return getLoginData;
  }
}
