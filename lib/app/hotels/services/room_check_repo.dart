import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/hotels/model/room_available.dart';
import 'package:hotel_book/app/utils/url.dart';

class RoomAvailableService {
  Future<RoomAvailabilityResponseModel?> roomAvailableRepo(
      RoomAvailableModel data) async {
    final dio = Dio(
      BaseOptions(baseUrl: Url.baseUrl),
    );

    try {
      final response = await dio.post(Url.isRoomAvailable, data: data.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return RoomAvailabilityResponseModel.fromJson(response.data);
      } else {
        return RoomAvailabilityResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return RoomAvailabilityResponseModel(
            message: 'Mobile Number Not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return RoomAvailabilityResponseModel(message: 'No internet Connection');
      }
      if (e.type == DioErrorType.response) {
        return RoomAvailabilityResponseModel(
            message: e.response!.data["message"]);
      }
      if (e.type == DioErrorType.other) {
        return RoomAvailabilityResponseModel(message: 'Something went wrong');
      }
      if (e is SocketException) {
        return RoomAvailabilityResponseModel(
            message: "Bad Internet Connection");
      }
      if (e is TimeoutException) {
        return RoomAvailabilityResponseModel(message: "Connection Timeout");
      }
    } catch (e) {
      log(e.toString());
      return RoomAvailabilityResponseModel(message: 'No Internet');
    }
    return null;
  }
}
