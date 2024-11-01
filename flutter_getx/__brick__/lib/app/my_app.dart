import 'package:{{project_name}}/app/config/loading_config.dart';
import 'package:{{project_name}}/app/core/app_navgiation_observer.dart';
import 'package:{{project_name}}/app/core/bindings/global_bindings.dart';
import 'package:{{project_name}}/app/core/themes/app_theme.dart';
import 'package:{{project_name}}/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Roboto', 'Merriweather');

// Configure EasyLoading
    LoadingConfig.configureAppLoader(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      textColor: Get.isDarkMode ? Colors.white : Colors.black,
      platform: Theme
          .of(context)
          .platform,
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: true,
            navigatorObservers: [AppNavigatorObserver()],
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: ThemeMode.system,
            initialBinding: GlobalBindings(),
            initialRoute: AppRouter.getInitialRoute(),
            getPages: AppRouter.routes,
            builder: EasyLoading.init(),
          );
        });
  }

}

