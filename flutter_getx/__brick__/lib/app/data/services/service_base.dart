import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:{{project_name}}/app/core/models/base_response_model.dart';
import 'package:{{project_name}}/app/data/network/api_client.dart';
import 'package:{{project_name}}/app/core/models/user_model.dart';

abstract class BaseService {
  final _apiClient = getx.Get.find<ApiClient>();

  Future<BaseResponse<T, U>> get({
    required String endpoint,
  }) async {
    try {
      var res = await _apiClient.getRequest(endpoint);
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    } catch (ex) {
      return BaseResponse(status: false,message: "", data: null);
    }
  }

  Future<BaseResponse<T, U>> post({
    required String endpoint,
    dynamic data,
  }) async {
    try {
      var res = await _apiClient.postRequest(endpoint, data: data);
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    } catch (ex) {
      return BaseResponse(status: false,message: "", data: null);
    }
  }

  Future<BaseResponse<T, U>> put({
    required String endpoint,
    dynamic data,
  }) async {
    try {
      var res = await _apiClient.putRequest(endpoint, data: data);
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    } catch (ex) {
      return BaseResponse(status: false,message: "", data: null);
    }
  }

  Future<BaseResponse<T, U>> delete({
    required String endpoint,
    dynamic queryParams,
  }) async {
    try {
      var res = await _apiClient.deleteRequest(endpoint,
          queryParameters: queryParams);
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    } catch (ex) {
      return BaseResponse(status: false,message: "", data: null);
    }
  }

  Future<BaseResponse<T, U>> multiPartPost({
    required String endpoint,
    required File file,
    required String fileKey,
    bool requiresAuthorizationHeader = true,
  }) async {
    try {
      String fileName = file.path
          .split('/')
          .last;
      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(file.path, filename: fileName),
      });
      // Make a multipart POST request
      return await post(
        endpoint: endpoint,
        data: formData,
      );
    } catch (ex) {
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    }
  }
}
