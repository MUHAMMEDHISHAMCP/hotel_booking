import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/hotels/model/payment/payment_respo.dart';
import 'package:hotel_book/app/services/interceptor.dart';
import 'package:hotel_book/app/services/internet_check.dart';
import 'package:hotel_book/app/utils/url.dart';

class PaymentServices {
  Future<PaymentResponseModel?> paymentRepo(int amount) async {
    if (await InternetCheck.checkInternet()) {
      final Dio dio = await InterceptorDio.getVerifiedUser();

      try {
        final response =
            await dio.post(Url.paynow, data: {"price":amount});
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        //  log(response.data.toString());
          return PaymentResponseModel.fromJson(response.data);
        } else {
          return PaymentResponseModel.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return PaymentResponseModel(message: 'Mobile Number Not valid');
        }
        if (e.type == DioErrorType.connectTimeout) {
          return PaymentResponseModel(message: 'No internet Connection');
        }
        if (e.type == DioErrorType.response) {
          return PaymentResponseModel(message: e.response!.data["message"]);
        }
        if (e.type == DioErrorType.other) {
          return PaymentResponseModel(message: 'Something went wrong');
        }
        if (e is SocketException) {
          return PaymentResponseModel(message: "Bad Internet Connection");
        }
        if (e is TimeoutException) {
          return PaymentResponseModel(message: "Connection Timeout");
        }
      } catch (e) {
        log(e.toString());
        return PaymentResponseModel(message: 'No Internet');
      }
      return null;
    } else {
      log('No Internet');
    }
  }
}
