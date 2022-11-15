import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingmodel.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingrespons.dart';
import 'package:hotel_book/app/services/interceptor.dart';
import 'package:hotel_book/app/services/internet_check.dart';
import 'package:hotel_book/app/utils/url.dart';

class BookingServices {
  Future<BookingResponse?> BookingRepo(BookingModel data) async {
    if (await InternetCheck.checkInternet()) {
      final Dio dio = await InterceptorDio.getVerifiedUser();

      try {
        final response =
            await dio.post(Url.booking, data: data.toJson());
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          log(response.data.toString());
          return BookingResponse.fromJson(response.data);
        } else {
          return BookingResponse.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return BookingResponse(message: 'Mobile Number Not valid');
        }
        if (e.type == DioErrorType.connectTimeout) {
          return BookingResponse(message: 'No internet Connection');
        }
        if (e.type == DioErrorType.response) {
          return BookingResponse(message: e.response!.data["message"]);
        }
        if (e.type == DioErrorType.other) {
          return BookingResponse(message: 'Something went wrong');
        }
        if (e is SocketException) {
          return BookingResponse(message: "Bad Internet Connection");
        }
        if (e is TimeoutException) {
          return BookingResponse(message: "Connection Timeout");
        }
      } catch (e) {
        log(e.toString());
        return BookingResponse(message: 'No Internet');
      }
      return null;
    } else {
      log('mouijk');
    }
  }
}
