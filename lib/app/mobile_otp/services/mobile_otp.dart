import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/mobile_otp/model/mobile_verify.dart';
import 'package:hotel_book/app/utils/url.dart';

class MobOtpRepo {
  Future<MobileOtpResponse> verificationService(MobileOtp data) async {
    final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
    try {
      final response = await dio.post(Url.otpVerify, data: data.toJson());
      log(response.data.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return MobileOtpResponse.fromJson(response.data);
      } 
    } on DioError catch (e) {
      log(e.response.toString());
      if (e.response!.statusCode == 401) {
        return MobileOtpResponse(message: 'OTP not valid');
      }
      if (e.type == DioErrorType.connectTimeout) {
        return MobileOtpResponse(message: 'No internet');
      }
      if (e.type == DioErrorType.other) {
        return MobileOtpResponse(message: 'Something went wrong');
      }

    } catch (e) {
      return MobileOtpResponse(message: '$e');
    }
    return MobileOtpResponse(message: 'Something went wrong');
  }
}
