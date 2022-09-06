import 'package:all_job/utils/model/api_response_object.dart';
import 'package:all_job/utils/model/job.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class AddJobAPI extends API {
  AddJobAPI._privateConstructor();

  static final AddJobAPI instance = AddJobAPI._privateConstructor();

  @override
  Map<String, String> get headers => {'x-token': 'anonystick.com'};

  Future<APIResponseObject<JobModel>> addJob({
    required String title,
    required String description,
    required String content,
    required String salary,
    required String location,
    required List<String> tags,
  }) async {
    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'content': content,
      'location': location,
      'tags': tags,
      'salary': salary,
      'images': [],
    };
    Response response = await postRequest('v1/services/post', data);

    Map<String, dynamic> json = response.data;

    return APIResponseObject.fromJson(
        json, (json) => JobModel.fromJson(json as Map<String, dynamic>));
  }
}
