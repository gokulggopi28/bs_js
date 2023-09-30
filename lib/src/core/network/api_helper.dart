import 'dart:html';

import 'package:bs_js/src/core/network/api_reposnse.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() => _instance;

  ApiHelper._internal();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://dducusat.fluttertrainer.in/',
      contentType: 'application/json',
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 2)));

  //Get Request

  Future<ApiResponse> makeGetRequest(String route,
      {Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(route,
          queryParameters: queryParameters, options: Options(headers: header));

      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

  //Post Request

  Future<ApiResponse> makePostRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(route,
          queryParameters: queryParameters, options: Options(headers: header));

      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

  //Patch Request

  Future<ApiResponse> makePatchRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.patch(route,
          queryParameters: queryParameters, options: Options(headers: header));

      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

  //Delete Request

  Future<ApiResponse> makeDeleteRequest(String route,
      {Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.delete(route,
          queryParameters: queryParameters, options: Options(headers: header));

      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }
}
