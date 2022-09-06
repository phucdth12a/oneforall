import 'package:all_job/utils/model/job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/api/job_api.dart';
import '../../utils/model/api_response_list.dart';

class SavedViewModel extends GetxController {
  var isLoading = false;
  var canLoadMore = false;
  final scrollController = ScrollController();

  var listJob = <JobModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getListJob();
    scrollController.addListener(onScroll);
  }

  onScroll() {
    if (isLoading || !canLoadMore) return;
    final thresholdReached = scrollController.position.extentAfter < 100;
    if (thresholdReached) {
      getListJob(offset: listJob.length);
    }
  }

  Future<void> onRefresh() async {
    getListJob();
  }

  getListJob({int offset = 0}) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    if (offset == 0) {
      listJob.value = [];
    }
    APIResponseList<JobModel> result = await JobAPI.instance
        .getAllJob(offset: offset, limit: 30, search: '', tags: []);
    List<JobModel> data = result.elements ?? [];
    listJob.addAll(data);
    canLoadMore = data.length == 30;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
    });
  }
}
