import 'package:all_job/utils/api/add_job_api.dart';
import 'package:all_job/utils/model/api_response_object.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../utils/alert/alert.dart';
import '../../utils/api/job_api.dart';
import '../../utils/model/api_response_list.dart';

class AddJobViewModel extends GetxController {
  final titleTextEditingController = TextEditingController();
  final contentTextEditingController = TextEditingController();
  final tagTextEditingController = TextEditingController();
  final locationTextEditingController = TextEditingController();
  final salaryTextEditingController = TextEditingController();

  var listTags = <String>[].obs;
  var listTagSelected = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListTags();
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    tagTextEditingController.dispose();
    locationTextEditingController.dispose();
    salaryTextEditingController.dispose();
    super.dispose();
  }

  getListTags() async {
    APIResponseList<String> result = await JobAPI.instance.listTags();
    listTags.value = result.elements ?? [];
  }

  addTag() {
    String tag = tagTextEditingController.text;
    if (tag.isNotEmpty) {
      listTagSelected.add(tag);
      tagTextEditingController.text = '';
    }
  }

  addJob(BuildContext context) async {
    String title = titleTextEditingController.text;
    String content = contentTextEditingController.text;
    String location = locationTextEditingController.text;
    String salary = salaryTextEditingController.text;
    if (title.isEmpty) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input title',
      );
      return;
    }
    if (content.isEmpty) {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Please input content',
      );
      return;
    }
    String description = content;
    if (content.length > 100) {
      description = content.substring(0, 100);
    }
    EasyLoading.show();
    APIResponseObject<JobModel> result = await AddJobAPI.instance.addJob(
        title: title,
        description: description,
        content: content,
        salary: salary,
        location: location,
        tags: listTagSelected);
    EasyLoading.dismiss();
    if (result.elements != null) {
      Alert.showAlert(
        context: context,
        title: 'Success',
        content: 'Create job success',
        action: () {
          Get.close(2);
        },
      );
    } else {
      Alert.showAlert(
        context: context,
        title: 'Error',
        content: 'Create job fail',
      );
    }
  }
}
