class RoomAvailableModel {
    RoomAvailableModel({
        this.hotelId,
       required this.startDate,
      required this.endDate,
        this.roomsCount,
    });

    String? hotelId;
    DateTime startDate;
    DateTime endDate;
    int? roomsCount;

     Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "roomsCount": roomsCount,
    };
}


class RoomAvailabilityResponseModel {
  bool isAvailable;
  String? message;

  RoomAvailabilityResponseModel({
    this.isAvailable = false,
    this.message,
  });

  factory RoomAvailabilityResponseModel.fromJson(Map<String, dynamic> json) {
    return RoomAvailabilityResponseModel(
      isAvailable: json["success"],
      message: json["message"],
    );
  }
  }
