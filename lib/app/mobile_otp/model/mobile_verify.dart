class MobileOtp {
  final String? otp;
  final String? hash;

  MobileOtp({
    required this.otp,
    required this.hash
  });

  Map<String, dynamic>? toJson() => {"otp": otp,"hash": hash};
}

class MobileOtpResponse {
  String? message;
  bool? created;
  String? phone;

  MobileOtpResponse({
    this.message,
    this.created,
    this.phone,
  });

  factory MobileOtpResponse.fromJson(Map<String, dynamic> json) =>
      MobileOtpResponse(
          message: json["message"] ?? '',
          created: json["created"] ?? false,
          phone: json["phone"] ?? '');
}
