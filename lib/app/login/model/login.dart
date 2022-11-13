
class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": email,
        "password": password,
      };
}

class LogInResponse {
  LogInResponse({
    this.isSuccess,
    this.profile,
    this.message,
  });

  bool? isSuccess;
  Profile? profile;
  String? message;

  factory LogInResponse.fromJson(Map<String, dynamic> json) =>
      LogInResponse(
          isSuccess: json["success"],
          profile: Profile.fromJson(json["profile"]),
          message: json["message"]);
}

class Profile {
  Profile({
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  String? name;
  String? email;
  String? phone;
  String? token;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        token: json["token"] ?? "",
      );
}
