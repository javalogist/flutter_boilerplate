import 'package:{{project_name}}/app/data/network/api_client.dart';
import 'package:{{project_name}}/app/data/network/dio_client.dart';
import 'package:{{project_name}}/app/core/controllers/app_controller.dart';
import 'package:get/get.dart';


class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.put(DioClient(), permanent: true);
    Get.put<ApiClient>(DioClient(), permanent: true);
  }
}
