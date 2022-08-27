import 'package:all_job/utils/api/job_api.dart';
import 'package:all_job/utils/model/api_response_list.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final searchController = TextEditingController();

  var listJob = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListJob();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> onRefresh() async {
    getListJob();
  }

  getListJob() async {
    APIResponseList<JobModel> result = await JobAPI.instance.getAllJob();
    listJob.value = result.elements ?? [];
  }
}
