
import 'package:dio/dio.dart';
import 'package:hotel_book/app/utils/strings.dart';
import 'package:hotel_book/app/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterceptorDio {
  static final  Dio _dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  static Future<Dio> getVerifiedUser() async {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (response, handler) async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final String token = pref.getString(KStrings.token) ?? '';
      _dio.interceptors.clear();
      response.headers.addAll({"Authorization": "Bearer $token"});
      return handler.next(response);
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 401) {
        return;
      }
    }, onResponse: ((kResponse, response) {
      return response.next(kResponse);
    })));
    return _dio;
  }
}