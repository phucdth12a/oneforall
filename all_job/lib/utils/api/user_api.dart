import 'package:all_job/utils/model/api_response_object.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import 'api.dart';

class UserAPI extends API {
  UserAPI._privateConstructor();

  static final UserAPI instance = UserAPI._privateConstructor();

  Future<APIResponseObject<int>> registerUser(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'PN100': const Uuid().v4(),
    };
    Response response = await postRequest('v1/services/user', data);

    Map<String, dynamic> json = response.data;

    return APIResponseObject.fromJson(json, (json) => json as int);
  }

  Future<APIResponseObject<int>> loginUser(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    Response response = await postRequest('v1/services/loginUser', data);

    Map<String, dynamic> json = response.data;

    return APIResponseObject.fromJson(json, (json) => json as int);
  }

//   register: jobviec.herokuapp.com/v1/services/user
// NV101: email
// NV103: pass

// Login: jobviec.herokuapp.com/v1/services/loginUser
// NV101: email
// NV103: pass
}
