import 'package:get/get.dart';
import 'package:wemove/data/api/api_client.dart';

class MoveSampleRepo extends GetxService{
  final ApiClient apiClient;
  MoveSampleRepo({required this.apiClient});

  Future<Response> getMoveSampleList() async{
    return await apiClient.getData("end point url");

  }
}