import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/utils/url.dart';

class LoginRepo {

  Future<LoginResponse?> loginService(LoginModel data) async {
    final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

    try {
      final response =
          await dio.post(Url.logIn, data: data.toJson());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
          if (e.response!.statusCode == 401) {
        return LoginResponse(message: 'Mobile Number Not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return LoginResponse(message: 'No internet Connection');
      }
      if (e.type == DioErrorType.response) {
        return LoginResponse(message:e.response!.data["message"]);
      }
      if (e.type == DioErrorType.other) {
        return LoginResponse(message: 'Something went wrong');
      }
      if (e is SocketException) {
        return LoginResponse(message: "Bad Internet Connection");
      }
      if (e is TimeoutException) {
        return LoginResponse(message: "Connection Timeout");
      }
    } catch (e) {
      log(e.toString());
      return LoginResponse(message:'No Internet');
    }
    return null;
  }
}
