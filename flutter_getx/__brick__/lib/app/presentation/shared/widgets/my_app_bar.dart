import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:{{project_name}}/app/core/themes/text_style.dart';
import 'package:{{project_name}}/app/core/app_navgiation_observer.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final routeController = Get.find<AppRouteObserverController>();
  final String title;
  final bool isDashboardTab;
  final bool shouldRefreshWallet;

  MyAppBar(
      {required this.title,
      this.isDashboardTab = false,
      this.shouldRefreshWallet = true});

  @override
  Widget build(BuildContext context) {
    // Call the wallet refresh function every time the AppBar is built
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var iconColor = isDarkMode ? Colors.white : Colors.black87;
    return AppBar(
        leading: Obx(() => routeController.isInitialRoute.value
            ? IconButton(
                icon: Icon(
                  Icons.menu_outlined,
                  color: iconColor,
                ),
                onPressed: () {},
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: iconColor,
                ),
                onPressed: () {
                  Get.back();
                })),
        title: Text(
          title,
          style: AppTextTheme.titleBoldStyle(),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
