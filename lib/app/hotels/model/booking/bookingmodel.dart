class BookingModel {
  BookingModel({
    required this.hotel,
    required this.start,
    required this.room,
    required this.end,
  });

  String hotel;
  String start;
  int room;
  String end;

  Map<String, dynamic> toJson() => {
        "hotel": hotel,
        "start": start,
        "room": room,
        "end": end,
      };
}

