import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/hotels/model/complete/req.dart';
import 'package:hotel_book/app/hotels/model/complete/response.dart';
import 'package:hotel_book/app/services/interceptor.dart';
import 'package:hotel_book/app/services/internet_check.dart';
import 'package:hotel_book/app/utils/url.dart';

class CompleteServices {
  Future<CompleteBookingResponse?> completeRepo(
      CompleteBookingRequestModel data,
      {String? signature}) async {
    if (await InternetCheck.checkInternet()) {
      final Dio dio = await InterceptorDio.getVerifiedUser();
      late Response response;
      try {
        if (signature != null) {
          response = await dio.post(
            Url.complete,
            data: data.toJson(),
            options: Options(
              headers: {"signature": signature},
            ),
          );
        } else {
          response = await dio.post(
            Url.complete,
            data: data.toJson(),
          );
        }

        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          log(response.data.toString());
          return CompleteBookingResponse.fromJson(response.data);
        } else {
          return CompleteBookingResponse.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return CompleteBookingResponse(message: 'Mobile Number Not valid');
        }
        if (e.type == DioErrorType.connectTimeout) {
          return CompleteBookingResponse(message: 'No internet Connection');
        }
        if (e.type == DioErrorType.response) {
          return CompleteBookingResponse(message: e.response!.data["message"]);
        }
        if (e.type == DioErrorType.other) {
          return CompleteBookingResponse(message: 'Something went wrong');
        }
        if (e is SocketException) {
          return CompleteBookingResponse(message: "Bad Internet Connection");
        }
        if (e is TimeoutException) {
          return CompleteBookingResponse(message: "Connection Timeout");
        }
      } catch (e) {
        log(e.toString());
        return CompleteBookingResponse(message: 'No Internet');
      }
      return null;
    } else {
      log('No Internet');
    }
    return null;
  }
}
