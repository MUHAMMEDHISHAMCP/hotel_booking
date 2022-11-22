import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingmodel.dart';
import 'package:hotel_book/app/hotels/model/booking/bookingrespons.dart';
import 'package:hotel_book/app/hotels/model/complete/req.dart';
import 'package:hotel_book/app/hotels/model/payment/payment_respo.dart';
import 'package:hotel_book/app/hotels/model/payment/razorpay.dart';
import 'package:hotel_book/app/hotels/model/room_availability/room_available.dart';
import 'package:hotel_book/app/hotels/services/booking.dart';
import 'package:hotel_book/app/hotels/services/complete_repo.dart';
import 'package:hotel_book/app/hotels/services/payment.dart';
import 'package:hotel_book/app/hotels/services/room_check_repo.dart';
import 'package:hotel_book/app/hotels/view/hotel_details.dart';
import 'package:hotel_book/app/login/model/login.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/navigations.dart';
import 'package:hotel_book/app/utils/strings.dart';
import 'package:hotel_book/app/widgets/bottomnav.dart';
import 'package:hotel_book/app/widgets/snackbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isAvailable = false;
  PaymentResponseModel? paymentResponseData;
  BookingResponse? bookingRes;

  void roomAvailabilityCheck(context, String hotelId, DateTime startDate,
      DateTime endDate, int roomCount, int total) async {
    isLoading = true;
    notifyListeners();
    RoomAvailableModel roomDetails = RoomAvailableModel(
      hotelId: hotelId,
      startDate: startDate,
      endDate: endDate,
      roomsCount: roomCount,
    );

    //  print(endDate);
    // print(emailController.text);
    // print(passwordController.text);

    RoomAvailabilityResponseModel? response =
        await RoomAvailableService().roomAvailableRepo(roomDetails);
    log('=====================');
    //  print(total);
    PaymentResponseModel? paymentResp =
        await PaymentServices().paymentRepo(total);
    if (paymentResp == null || response == null) {
      ShowDialogs.popUp('Something error');
      isLoading = false;
      notifyListeners();
      return;
    } else if (response.isAvailable == true) {
      paymentResponseData = paymentResp;
      // print(paymentResponseData!.amount.toString());
      isLoading = false;
      notifyListeners();
      // Navigations.pop();

      ShowDialogs.popUp(
        "Room Available",
        mainColor,
      );
      getRoomData(context, hotelId, startDate, endDate, roomCount);
      isLoading = false;
      notifyListeners();
    } else {
      // log(response.message.toString());
      isLoading = false;
      notifyListeners();
      Navigations.pop();
      ShowDialogs.popUp(
        'Room Not Available',
      );
      isLoading = false;
      notifyListeners();
    }
  }

  void getRoomData(context, String hotelId, DateTime startDate,
      DateTime endDate, int roomCount) async {
    print(endDate);
    BookingModel roomDetails = BookingModel(
        hotel: hotelId,
        start: startDate.toString(),
        room: roomCount,
        end: endDate.toString());

    BookingResponse? response =
        await BookingServices().BookingRepo(roomDetails);
    if (response!.success == true) {
      log('response.message.toString()');
      bookingRes = response;
      isAvailable = true;
      notifyListeners();
      // log('response');
      // log('sldhj')
    } else {}
  }

  late Razorpay razorPay;
  void initializeRazorPay() {
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerErrorFailure);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) async {
    await _payOnline(
      response.signature,
      response.paymentId,
      response.orderId,
    );
    Navigations.pushRemoveUntil(const BottomNav());
    ShowDialogs.popUp('Payment Success', mainColor);
    razorPay.clear();
  }

  void _handlerErrorFailure(PaymentFailureResponse response) {
    razorPay.clear();
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    razorPay.clear();
  }

  // Future<void> _completeBooking({
  //   required String paymentType,
  //   String? signature,
  //   String? payId,
  //   String? odrId,
  // }) async {
  //   if (bookingRes == null) {
  //     return;
  //   } else {
  //     isLoading = true;
  //     notifyListeners();
  //     if (paymentType == 'PAY AT HOTEL') {
  //       final data = CompleteBookingRequestModel(
  //         rooms: bookingRes?.response?.room ?? '',
  //         checkout: bookingRes?.response?.id ?? '',
  //         pay: paymentType,
  //       );
  //       final complete = await CompleteServices().completeRepo(data);
  //       if (complete == null) {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Booking failed !!');
  //         return;
  //       } else if (complete.success == true) {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Successfully booked', Colors.green);
  //         await Future.delayed(const Duration(seconds: 1));
  //         Navigations.pushRemoveUntil(HotelDetails);
  //         return;
  //       } else {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Booking failed !!');
  //         return;
  //       }
  //     } else {
  //       final data = CompleteBookingRequestModel(
  //         rooms: bookingRes?.response?.room ?? '',
  //         checkout: bookingRes?.response?.id ?? '',
  //         pay: paymentType,
  //         razorpaymentId: payId,
  //         order: odrId,
  //       );
  //       final complete =
  //           await CompleteServices().completeRepo(data, signature: signature);
  //       if (complete == null) {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Booking failed !!');
  //         return;
  //       } else if (complete.success == true) {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Successfully booked', mainColor);
  //         await Future.delayed(
  //           const Duration(seconds: 1),
  //         );
  //         Navigations.pushRemoveUntil(HotelDetails);
  //         return;
  //       } else {
  //         isLoading = false;
  //         notifyListeners();
  //         ShowDialogs.popUp('Booking failed !!');
  //       }
  //     }
  //   }
  // }

  Future<void> payAtHotel() async {
    if (bookingRes == null) {
      print('object');
      return;
    }
    isLoading = true;
    notifyListeners();
    final data = CompleteBookingRequestModel(
      rooms: bookingRes?.response?.room ?? '',
      checkout: bookingRes?.response?.id ?? '',
      pay: 'PAY AT HOTEL',
    );
    final complete = await CompleteServices().completeRepo(data);
    if (complete == null) {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp('Booking failed !!');
      return;
    } else if (complete.success == true) {
      isLoading = false;
      notifyListeners();
      Navigations.pop();
      ShowDialogs.popUp('Successfully booked', mainColor);
      await Future.delayed(const Duration(seconds: 1));
      // Navigations.pushRemoveUntil(HotelDetails);
      return;
    } else {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp('Booking failed !!');
      Navigations.pop();
      return;
    }
  }

  Future<void> _payOnline(
    String? signature,
    String? payId,
    String? odrId,
  ) async {
    if (bookingRes == null) {
      print('nulll');
      return;
    }
    final data = CompleteBookingRequestModel(
      rooms: bookingRes?.response?.room ?? '',
      checkout: bookingRes?.response?.id ?? '',
      pay: 'ONLINE',
      razorpaymentId: payId,
      order: odrId,
    );
    final complete =
        await CompleteServices().completeRepo(data, signature: signature);
    if (complete == null) {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp('Booking failed !!');
      return;
    } else if (complete.success == true) {
      // print(complete.message);
      isLoading = false;
      notifyListeners();
      // await Future.delayed(
      //   const Duration(seconds: 1),
      // );
      // Navigations.pushRemoveUntil(HotelDetails);
      //ShowDialogs.popUp('Successfully booked', mainColor);
      return;
    } else {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp('Booking failed !!');
    }
  }

  Future<void> onPayNowButton(int amount) async {
    final PaymentResponseModel? response = await _getOnlinePaymentData(amount);
    if (response == null) {
      ShowDialogs.popUp('Oops!! Something went wrong. Please try again later');
      return;
    }
    final options = await _razorPayData(response);
    try {
      Navigations.pop();
      razorPay.open(options.toJson());
      // razorPay.open(options.toJson());
      notifyListeners();
    } catch (e) {
      log(e.toString());
      ShowDialogs.popUp('Something went wrong !!');
    }
  }

  Future<PaymentResponseModel?> _getOnlinePaymentData(int amount) async {
    isLoading = true;
    notifyListeners();
    final PaymentResponseModel? response =
        await PaymentServices().paymentRepo(amount);
    if (response == null) {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp('Something went wrong !!');
      return null;
    } else if (response.id != null) {
      isLoading = false;
      notifyListeners();
      return response;
    } else {
      isLoading = false;
      notifyListeners();
      ShowDialogs.popUp(response.message ?? 'Something went wrong !!');
      return null;
    }
  }

  Future<RazorpayCheckoutModel> _razorPayData(
      PaymentResponseModel response) async {
    final pref = await SharedPreferences.getInstance();
    final userData = LogInResponse(
        profile: Profile(
      name: pref.getString(KStrings.userName),
      email: pref.getString(KStrings.email),
      phone: pref.getString(KStrings.phone),
    ));
    RazorpayCheckoutModel options = RazorpayCheckoutModel(
        key: response.keyId,
        amount: response.amount.toString(),
        currency: response.currency,
        name: "Boom My Room",
        description: "Payment to book your selected room via Boom My Room",
        orderId: response.id,
        prefill: Prefill(
          name: userData.profile?.name ?? '',
          email: userData.profile?.email ?? '',
          contact: userData.profile?.phone ?? '',
        ));
    print(options.prefill!.name);
    return options;
  }
}
