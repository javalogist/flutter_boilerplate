import 'package:{{project_name}}/app/config/app_constants.dart';
import 'package:{{project_name}}/app/core/utils/shared_pref.dart';
import 'package:{{project_name}}/app/presentation/auth/bindings/auth_bindings.dart';
import 'package:{{project_name}}/app/presentation/auth/views/login_view.dart';
import 'package:{{project_name}}/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppRouter {
  static String getInitialRoute() {
    var isMpinSet = SharedPref.getString(AppConstants.mpinSet) == "true";
    return isMpinSet
        ? AppRoutes.mpinScreen
        : AppRoutes.loginScreen; // Adjust if more logic is added
  }

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.loginScreen, page: () => LoginView(), binding: AuthBindings()),
    // Add other routes here
  ];
}
