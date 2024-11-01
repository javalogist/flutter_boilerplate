import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:{{project_name}}/app/core/utils/shared_pref.dart';
import 'package:{{project_name}}/app/core/utils/ui_helper.dart';
import 'package:{{project_name}}/app/routes/app_routes.dart';

class AppController extends GetxController {
  void handleUnauthorized() {
    EasyLoading.dismiss();
    SharedPref.deleteAll();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void handleError(String errorMessage) {
    EasyLoading.dismiss();
    if (errorMessage != '') {
      AlertManager.showErrorAlert(errorMessage);
    }
  }

  void handleNotFound() {}

  void handleRateLimitExceeded() {}

  void handleServerError() {
    EasyLoading.dismiss();
    AlertManager.showErrorAlert('Something went wrong! Please try again');
  }
}
