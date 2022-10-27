class MobNoModel {
  final String? phoneNumber;

  MobNoModel({
    required this.phoneNumber,
  });

  Map<String, dynamic>? toJson() => {"phone_number": phoneNumber};}

class MobNoResponse {
  String? message;
  bool? success;
  String? hash;

  MobNoResponse({
    this.message,
    this.success,
    this.hash,
  });

  factory MobNoResponse.fromJson(Map<String, dynamic> json) =>
      MobNoResponse(
          message: json["message"] ?? '',
          success: json["success"] ?? false,
          hash: json["hash"] ?? '');
}
