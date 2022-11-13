class RoomAvailableModel {
    RoomAvailableModel({
        this.hotelId,
        this.startDate,
        this.endDate,
        this.roomsCount,
    });

    String? hotelId;
    String? startDate;
    String? endDate;
    int? roomsCount;

     Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "startDate": startDate,
        "endDate": endDate,
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
