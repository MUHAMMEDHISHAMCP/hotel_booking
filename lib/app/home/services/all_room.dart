import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/services/internet_check.dart';
import 'package:hotel_book/app/utils/url.dart';

class AllRoomRepo {
  final dio = Dio(
    BaseOptions(baseUrl: Url.baseUrl),
  );

  Future<AllRoomResponse?> allRoomServices() async {
    if (await InternetCheck.checkInternet()) {
      try {
        final response = await dio.get(Url.getAllRooms);

        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          final datas = (response.data as List).map((e) {
            return AllRoomsModel.fromJson(e);
          }).toList();
          log(response.data[1].toString());
          return AllRoomResponse(roomList: datas);
        }
      } on DioError catch (e) {
        // if (e.response!.statusCode == 401) {
        //   return SignUpResponse(erMsg: 'Something went wrong ');
        // }
        //  if (e.response!.statusCode == 401) {
        //     return AllRoomResponse(erMsg: 'Mobile Number Not valid');
        //   }
        if (e.type == DioErrorType.connectTimeout) {
          return AllRoomResponse(
              erMsg: 'No internet Connection', isFailed: true);
        }
        if (e.type == DioErrorType.response) {
          return AllRoomResponse(
              erMsg: "Service not available", isFailed: true);
        }
        if (e.type == DioErrorType.other) {
          return AllRoomResponse(erMsg: 'Something went wrong', isFailed: true);
        }
        if (e is SocketException) {
          return AllRoomResponse(
              erMsg: "Bad Internet Connection", isFailed: true);
        }
        if (e is TimeoutException) {
          return AllRoomResponse(erMsg: "Connection Timeout", isFailed: true);
        }
      } catch (e) {
        return AllRoomResponse(erMsg: e.toString());
      }
    } else {
      return AllRoomResponse(erMsg: 'No Internet', isFailed: true);
    }
  }
}
