import 'package:get/get.dart';
import 'package:wemove/data/repository/move_sample_repo.dart';
import 'package:wemove/models/move_samples_StartPage_model.dart';

class MoveSampleController extends GetxController{
  final MoveSampleRepo moveSampleRepo;
  MoveSampleController({required this.moveSampleRepo});
  List<dynamic> _moveSampleList=[];
  List<dynamic> get moveSampleList => _moveSampleList;


  Future<void> getMoveSampleList()async {
   Response response = await moveSampleRepo.getMoveSampleList();
   if(response.statusCode==200) {

     print("got products");
     _moveSampleList=[];
    _moveSampleList.addAll(SamplemovesStartpage.fromJson(response.body).movesamples);
     update();
   } else {

   }

  }
}