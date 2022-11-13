import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/utils/url.dart';

class LoginRepo {

  Future<LogInResponse?> loginService(LoginModel data) async {
    final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

    try {
      final response =
          await dio.post(Url.logIn, data: data.toJson());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return LogInResponse.fromJson(response.data);
      } else {
        return LogInResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
          if (e.response!.statusCode == 401) {
        return LogInResponse(message: 'Mobile Number Not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return LogInResponse(message: 'No internet Connection');
      }
      if (e.type == DioErrorType.response) {
        return LogInResponse(message:e.response!.data["message"]);
      }
      if (e.type == DioErrorType.other) {
        return LogInResponse(message: 'Something went wrong');
      }
      if (e is SocketException) {
        return LogInResponse(message: "Bad Internet Connection");
      }
      if (e is TimeoutException) {
        return LogInResponse(message: "Connection Timeout");
      }
    } catch (e) {
      log(e.toString());
      return LogInResponse(message:'No Internet');
    }
    return null;
  }
}
