import 'dart:io';

class InternetCheck {
  // static Future<bool> interNetCheck() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   return result;
  // }

  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
