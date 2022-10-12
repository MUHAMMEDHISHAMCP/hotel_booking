import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/utils/url.dart';

class LoginRepo {

  Future<LoginResponse?> loginService(LoginModel data) async {
    final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

    try {
      final response =
          await dio.post(Url.logIn, data: data.tojson());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return LoginResponse(message: 'Something went wrong');
      }
       if (e.response?.data == DioErrorType.connectTimeout) {
        return LoginResponse(message: 'Connection TimeOut');
      } 
    } catch (e) {
      log(e.toString());
      return LoginResponse(message:'No Internet');
    }
    return null;
  }
}
