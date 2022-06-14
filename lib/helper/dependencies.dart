import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wemove/controllers/move_samples_controllers.dart';
import 'package:wemove/data/api/api_client.dart';
import 'package:wemove/data/repository/move_sample_repo.dart';

Future<void> init()async {
  //api client
 Get.lazyPut(()=>ApiClient(appBaseUrl: "your url"));

 //repos
 Get.lazyPut(()=>MoveSampleRepo(apiClient: Get.find()));

 //controllers
 Get.lazyPut(() => MoveSampleController(moveSampleRepo: Get.find()));
}