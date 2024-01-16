

import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) => List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
    int id;
    String name;
    String email;
    Gender gender;
    Status status;

    LoginModel({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: genderValues.map[json["gender"]]!,
        status: statusValues.map[json["status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": genderValues.reverse[gender],
        "status": statusValues.reverse[status],
    };
}

enum Gender {
    female,
    male
}

final genderValues = EnumValues({
    "female": Gender.female,
    "male": Gender.male
});

enum Status {
    active,
    inactive
}

final statusValues = EnumValues({
    "active": Status.active,
    "inactive": Status.inactive
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
