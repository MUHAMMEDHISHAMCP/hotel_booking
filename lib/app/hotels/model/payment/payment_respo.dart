class PaymentResponseModel {
  PaymentResponseModel({
    this.id,
    this.currency,
    this.amount,
    this.receipt,
    this.keyId,
    this.message,
  });

  String? id;
  String? currency;
  int? amount;
  String? receipt;
  String? keyId;
  String? message;
  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        id: json["id"],
        currency: json["currency"],
        amount: json["amount"],
        receipt: json["receipt"],
        keyId: json["key_id"],
      );
}
