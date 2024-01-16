import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:postapi/model/signup_request_model.dart';

class ApiService {
  static Future<void> postData(SignupModel signupModel) async {
    try {
      final response =
          await http.post(Uri.parse('https://gorest.co.in/public/v2/users'),
              headers: <String, String>{
                "Content-Type": "application/json",
                "Authorization":
                    "Bearer c9deacfd00d58aef0219b783eebff9cbac46821034ee07d465a2424b341c7725"
              },
              body: albumToJson(signupModel));

      if (response.statusCode == 201) {
        log("response.body is ${response.body}");
      } else {
        throw Exception('Failed to Upload Data');
      }
    } catch (e) {
      log("Failed to Load $e");
    }
  }
}
