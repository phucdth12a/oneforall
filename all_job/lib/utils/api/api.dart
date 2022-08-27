import 'dart:io' show HttpHeaders, Platform;

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant/constant.dart';

class API {
  late Dio _dio;
  String get baseUrl => 'https://jobviec.herokuapp.com/';

  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: '',
        HttpHeaders.contentTypeHeader: "application/json",
      };

  API() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      // headers: headers,
    ));
    // _dio.httpClientAdapter = Http2Adapter(
    //   ConnectionManager(
    //     idleTimeout: 10000,
    //     // Ignore bad certificate
    //     onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
    //   ),
    // );
    _dio.interceptors.clear();
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      maxWidth: 100,
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // printWrapped('onError', name: 'API', error: e);
          handler.next(e);
        },
      ),
    );
  }

  Future<Response> getRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.get, endPoint, data, salt: salt);
  }

  Future<Response> postRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.post, endPoint, data, salt: salt);
  }

  Future<Response> patchRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.patch, endPoint, data, salt: salt);
  }

  Future<Response> deleteRequest(String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    return makeRequest(HttpMethod.delete, endPoint, data, salt: salt);
  }

  Future<Response> makeRequest(
      HttpMethod method, String endPoint, Map<String, dynamic> data,
      {String? salt}) async {
    Response response =
        Response(requestOptions: RequestOptions(path: endPoint));
    data = await createToken(data);
    Map<String, dynamic>? queryParameters;
    if (method == HttpMethod.get) {
      queryParameters = data;
    }

    try {
      _dio.options.headers = headers;
      response = await _dio.request(
        endPoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          validateStatus: (status) => true,
          method: method.value,
        ),
      );
    } on DioError catch (e) {
      print('makeRequest API $e');
    }
    return response;
  }

  Future<Map<String, dynamic>> createToken(Map<String, dynamic> data) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      data["MODEL"] = androidInfo.model;
      data["SRC"] = "android";
      data["OS"] = androidInfo.version.baseOS;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      data["MODEL"] = iosInfo.utsname.machine;
      data["SRC"] = "ios";
      data["OS"] = iosInfo.systemVersion;
    }
    data["VERSION"] = kVersion;
    data["PROV"] = "PM";
    data["APP"] = "AllJob";
    return data;
  }
}

enum HttpMethod {
  delete('DELETE'),
  get('GET'),
  head('HEAD'),
  options('OPTIONS'),
  patch('PATCH'),
  post('POST'),
  put('PUT');

  final String value;
  const HttpMethod(this.value);
}
