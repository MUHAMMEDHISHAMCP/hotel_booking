class SignUpModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;

  SignUpModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic>? toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
}

class SignUpResponse {
  String? message;
  bool? created;
  String? jwtKey;

  SignUpResponse({
    this.message,
    this.created,
    this.jwtKey,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        message: json["message"] ?? "",
        created: json["created"] ?? false,
        jwtKey: json["jwt_key"] ?? "",
      );
}
