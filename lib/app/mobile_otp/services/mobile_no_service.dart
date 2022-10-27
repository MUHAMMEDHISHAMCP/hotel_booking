import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/mobile_otp/model/mobile_otp.dart';
import 'package:hotel_book/app/utils/url.dart';

class MobNoRepo {
  Future<MobNoResponse> loginService(MobNoModel data) async {
    final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
    try {
      final response = await dio.post(Url.phoneSignIn, data: data.toJson());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return MobNoResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
       log(e.response.toString());
      if (e.response!.statusCode == 401) {
        return MobNoResponse(message: 'Mobile Number Not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return MobNoResponse(message: 'No internet Connection');
      }
      if (e.type == DioErrorType.response) {
        return MobNoResponse(message:e.response!.data["message"]);
      }
      if (e.type == DioErrorType.other) {
        return MobNoResponse(message: 'Something went wrong');
      }
      if (e is SocketException) {
        return MobNoResponse(message: "Bad Internet Connection");
      }
      if (e is TimeoutException) {
        return MobNoResponse(message: "Connection Timeout");
      }
    } catch (e) {
      return MobNoResponse(message: e.toString());
    }
    return MobNoResponse(message: 'Something went wrong');
  }
}
