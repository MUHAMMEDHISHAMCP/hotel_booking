// class DioException{
//   static String exception(e)
//        if (e.response!.statusCode == 401) {
//         return LoginResponse(message: 'Mobile Number Not valid');
//       }
//       if (e.type == DioErrorType.connectTimeout) {
//         return LoginResponse(message: 'No internet Connection');
//       }
//       if (e.type == DioErrorType.response) {
//         return LoginResponse(message:e.response!.data["message"]);
//       }
//       if (e.type == DioErrorType.other) {
//         return LoginResponse(message: 'Something went wrong');
//       }
//       if (e is SocketException) {
//         return LoginResponse(message: "Bad Internet Connection");
//       }
//       if (e is TimeoutException) {
//         return LoginResponse(message: "Connection Timeout");
//       }
// }