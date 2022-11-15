// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromJson(jsonString);

import 'dart:convert';

BookingResponse bookingResponseFromJson(String str) => BookingResponse.fromJson(json.decode(str));

String bookingResponseToJson(BookingResponse data) => json.encode(data.toJson());

class BookingResponse {
    BookingResponse({
        this.success,
        this.response,
        this.message,
    });

    bool? success;
    Response? response;
    String? message;

    factory BookingResponse.fromJson(Map<String, dynamic> json) => BookingResponse(
        success: json["success"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "response": response!.toJson(),
    };
}

class Response {
    Response({
        this.user,
        this.room,
        this.roomNumber,
        this.date,
        this.days,
        this.bookingId,
        this.isBooked,
        this.completed,
        this.cancel,
        this.id,
        this.v,
    });

    String? user;
    String?room;
    int? roomNumber;
    Date? date;
    String?days;
    String?bookingId;
    bool? isBooked;
    bool? completed;
    bool? cancel;
    String?id;
    int? v;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        user: json["user"],
        room: json["room"],
        roomNumber: json["roomNumber"],
        date: Date.fromJson(json["Date"]),
        days: json["days"],
        bookingId: json["bookingId"],
        isBooked: json["isBooked"],
        completed: json["completed"],
        cancel: json["cancel"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "room": room,
        "roomNumber": roomNumber,
        "Date": date!.toJson(),
        "days": days,
        "bookingId": bookingId,
        "isBooked": isBooked,
        "completed": completed,
        "cancel": cancel,
        "_id": id,
        "__v": v,
    };
}

class Date {
    Date({
        this.startDate,
        this.endDate,
    });

    DateTime? startDate;
    DateTime? endDate;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
    };
}
