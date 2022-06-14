import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders; //Map for storing data locally

  ApiClient({ required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'apllication/json; charset=UTF-8',
      //we need data type in json
      'Authorization': 'Bearer $token',
      //a token from device to server
    };
  }

  Future<Response> getData(String uri,) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}