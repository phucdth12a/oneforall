import 'package:all_job/utils/model/api_response_list.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class JobAPI extends API {
  JobAPI._privateConstructor();

  static final JobAPI instance = JobAPI._privateConstructor();

  Future<APIResponseList<JobModel>> getAllJob() async {
    Map<String, dynamic> data = {};
    Response response = await getRequest('v1/services/jobs', data);

    Map<String, dynamic> json = response.data;

    return APIResponseList.fromJson(
        json, (json) => JobModel.fromJson(json as Map<String, dynamic>));
  }
}
