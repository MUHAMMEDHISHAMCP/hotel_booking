import 'package:dio/dio.dart';
import 'package:hotel_book/app/home/model/room_model.dart';
import 'package:hotel_book/app/utils/url.dart';

class AllRoomRepo{
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl),);

  Future<AllRoomResponse> allRoomServices()async{

  }

}