import 'package:all_job/utils/model/job.dart';
import 'package:get/get.dart';

class DetailViewModel extends GetxController {
  var top = 0.0.obs;

  var job = JobModel();

  @override
  void onInit() {
    job = Get.arguments as JobModel;
    super.onInit();
  }
}
