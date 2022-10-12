
class LoginModel {
  String email;
  String paassword;

  LoginModel({required this.email, required this.paassword});

  Map<String, dynamic> tojson() => {
        "email": email,
        "password": paassword,
      };
}

class LoginResponse {
  String? message;
  String? token;

  LoginResponse({this.token, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"] ?? '',
        token: json["token"] ?? '',
      );
}
