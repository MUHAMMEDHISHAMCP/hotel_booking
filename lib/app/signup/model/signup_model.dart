

class SignUpModel {
  String userName;
  String email;
  String password;
  String confirmPassword;
  String role;

  SignUpModel(
      {required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.role});

  Map<String, dynamic> tojson() => {
        "name": userName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "role": role
      };
}

class SignUpResponse {
  String? message;
  String? id;

  SignUpResponse({this.message, this.id});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        message: json["message"] ?? '',
        id: json["userId"] ?? '',
      );
}
