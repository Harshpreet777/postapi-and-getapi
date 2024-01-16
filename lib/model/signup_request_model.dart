
import 'dart:convert';

SignupModel albumFromJson(String str) => SignupModel.fromJson(json.decode(str));

String albumToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    String email;
    String name;
    String gender;
    String status;

    SignupModel({
        required this.email,
        required this.name,
        required this.gender,
        required this.status,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        name: json["name"],
        gender: json["gender"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "gender": gender,
        "status": status,
    };
}
