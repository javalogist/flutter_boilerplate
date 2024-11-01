import 'package:{{project_name}}/app/core/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ControllerBase extends GetxController {
  Future<void> executeApiCall<T>({
    required Future<T> Function() apiCall,
    required Future<void> Function(T? data) onSuccess,
    required Future<void> Function(String? error)? onFailure,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
      );
      var response = await apiCall();
      debugPrint("API has been called with successful response");
      onSuccess(response);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint("An exception occurred: ${e.toString()}");
      EasyLoading.dismiss();
      if (onFailure != null)
        onFailure(e.toString());
      else
        AlertManager.showErrorAlert("Something went wrong. Please try again!");
    }
  }

  Future<void> executeMultipleApiCalls<T>({
    required List<Future<T>> Function() apiCalls,
    required Function(List<T?> data) onSuccess,
    required Function(String? error) onFailure,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        maskType: EasyLoadingMaskType.black,
      );

      // Execute all API calls in parallel
      var responses = await Future.wait(apiCalls());

      // If all API calls succeeded, collect the data
      List<T?> data = responses.map((response) => response).toList();
      onSuccess(data);
    } catch (e) {
      debugPrint("Exception occurred: $e");
      AlertManager.showErrorAlert("Something went wrong. Please try again!");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
