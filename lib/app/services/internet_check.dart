import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCheck {
  static Future<bool> interNetCheck() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
}
