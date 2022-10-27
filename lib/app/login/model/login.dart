
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

class LoginResponse {
   LoginResponse({
    this.message,
    this.created,
    this.jwtKey,
  });

  String? message;
  bool? created;
  String? jwtKey;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        message: json["message"] ?? "",
        created: json["created"] ?? false,
        jwtKey: json["jwt_key"] ?? ""
      );
}
