import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/signup/model/signup_model.dart';
import 'package:hotel_book/app/utils/url.dart';

class SignUpServices {
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

  Future<SignUpResponse> singnUpRepo(SignUpModel data) async {
    try {
      // print('object');
      final response = await dio
          .post(Url.signUp, data: data.toJson())
          .then((value) => value);
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return SignUpResponse.fromJson(response.data);
      } else {
        // print('ll');
        return SignUpResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      // if (e.response!.statusCode == 401) {
      //   return SignUpResponse(message: 'Something went wrong ');
      // }
     if (e.response!.statusCode == 401) {
        return SignUpResponse(message: 'Mobile Number Not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return SignUpResponse(message: 'No internet Connection');
      }
      if (e.type == DioErrorType.response) {
        return SignUpResponse(message:e.response!.data["message"]);
      }
      if (e.type == DioErrorType.other) {
        return SignUpResponse(message: 'Something went wrong');
      }
      if (e is SocketException) {
        return SignUpResponse(message: "Bad Internet Connection");
      }
      if (e is TimeoutException) {
        return SignUpResponse(message: "Connection Timeout");
      }
    } catch (e) {
      return SignUpResponse(message: e.toString());
    }
    return SignUpResponse(message: "Something Went wrong");
  }
}
