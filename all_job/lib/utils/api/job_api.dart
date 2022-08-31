import 'package:all_job/utils/model/api_response_list.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class JobAPI extends API {
  JobAPI._privateConstructor();

  static final JobAPI instance = JobAPI._privateConstructor();

  Future<APIResponseList<JobModel>> getAllJob({
    required int offset,
    required int limit,
    required String search,
    required List<String> tags,
  }) async {
    Map<String, dynamic> data = {
      'offset': offset,
      'limit': limit,
      'filter': [
        {'k': 'search', 'v': search},
        {'k': 'tags', 'v': tags}
      ]
    };
    Response response = await postRequest('v1/services/jobs', data);

    Map<String, dynamic> json = response.data;

    return APIResponseList.fromJson(
        json, (json) => JobModel.fromJson(json as Map<String, dynamic>));
  }

  Future<APIResponseList<String>> listTags() async {
    Map<String, dynamic> data = {};
    Response response = await getRequest('v1/services/tags', data);

    Map<String, dynamic> json = response.data;

    return APIResponseList.fromJson(json, (json) => json as String);
  }

  Future<APIResponseList<JobModel>> listJobRecomends() async {
    Map<String, dynamic> data = {};
    Response response = await getRequest('v1/services/recommentss', data);

    Map<String, dynamic> json = response.data;

    return APIResponseList.fromJson(
        json, (json) => JobModel.fromJson(json as Map<String, dynamic>));
  }
}
