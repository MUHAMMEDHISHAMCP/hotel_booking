import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/signup/model/signup_model.dart';
import 'package:hotel_book/app/utils/url.dart';

class SignUpServices {
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));

  Future<SignUpResponse> singnUpRepo(SignUpModel data) async {
    try {
      // print('object');
      final response = await dio
          .post(Url.signUp, data: data.tojson())
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
      if (e.response?.data == DioErrorType.connectTimeout) {
        return SignUpResponse(message: 'Connection TimeOut');
      } else {
        return SignUpResponse(message: 'No Internet !!');
      }
    } catch (e) {
      return SignUpResponse(message: e.toString());
    }
  }
}
