import 'package:all_job/utils/api/job_api.dart';
import 'package:all_job/utils/model/api_response_list.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class HomeViewModel extends GetxController {
  final searchController = TextEditingController();
  final debouncer = Debouncer(delay: const Duration(seconds: 1));
  final scrollController = ScrollController();

  var isLoading = false;
  var canLoadMore = false;

  var listTags = <String>[].obs;
  var listTagsSelected = <String>[].obs;
  var listRecomendJob = <JobModel>[].obs;
  var listJob = <JobModel>[].obs;

  var currentSearch = '';

  @override
  void onInit() {
    super.onInit();
    getListTags();
    getListRecommend();
    getListJob('', true);
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    searchController.dispose();
    debouncer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  onScroll() {
    if (isLoading || !canLoadMore) return;
    final thresholdReached = scrollController.position.extentAfter < 100;
    if (thresholdReached) {
      getListJob(currentSearch, false, offset: listJob.length);
    }
  }

  Future<void> onRefresh() async {
    getListJob(currentSearch, true);
  }

  getListTags() async {
    APIResponseList<String> result = await JobAPI.instance.listTags();
    listTags.value = result.elements ?? [];
  }

  getListRecommend() async {
    APIResponseList<JobModel> result = await JobAPI.instance.listJobRecomends();
    listRecomendJob.value = result.elements ?? [];
  }

  getListJob(String search, bool force, {int offset = 0}) async {
    if (isLoading) {
      return;
    }
    currentSearch = search;
    isLoading = true;
    if (offset == 0) {
      listJob.value = [];
    }
    APIResponseList<JobModel> result = await JobAPI.instance.getAllJob(
        offset: offset,
        limit: 30,
        search: currentSearch,
        tags: listTagsSelected);
    List<JobModel> data = result.elements ?? [];
    listJob.addAll(data);
    canLoadMore = data.length == 30;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
    });
  }
}
