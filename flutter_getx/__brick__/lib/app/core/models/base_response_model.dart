import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:{{project_name}}/app/core/models/base_response_model.dart';
import 'package:{{project_name}}/app/data/network/api_client.dart';

abstract class BaseService {
  final _apiClient = getx.Get.find<ApiClient>();

  Future<BaseResponse<T, U>> get<T,U>({
    required String endpoint,
  }) async {
    try {
      var res = await _apiClient.getRequest(endpoint);
      return BaseResponse<T, U>.fromJson(res.data as Map<String, dynamic>);
    } catch (ex) {
      return BaseResponse(status: false,message: "", data: null);
    }
  }

  Future<BaseResponse<T, U>> post<T,U>({
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

  Future<BaseResponse<T, U>> put<T,U>({
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

  Future<BaseResponse<T, U>> delete<T,U>({
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

  Future<BaseResponse<T, U>> multiPartPost<T,U>({
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
      return BaseResponse(status: false,message: "", data: null);
    }
  }
}
