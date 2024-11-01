import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoadingConfig {
  static void configureAppLoader({
    required Color backgroundColor,
    required Color textColor,
    required TargetPlatform platform,
  }) {
    // Determine the indicator widget based on the platform
    Widget indicator = platform == TargetPlatform.iOS
        ? CupertinoActivityIndicator(radius: 10)
        : Container(
      width: 50, // Fixed width
      height: 50, // Fixed height
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 10,
            offset: Offset(0, 2), // Shadow offset
          ),
        ],
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Get.isDarkMode ? Colors.white : Colors.blue, // Indicator color
          ),
        ),
      ),
    );

    // Configure EasyLoading with the determined settings
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorWidget = indicator
      ..backgroundColor = backgroundColor
      ..textColor = textColor
      ..maskColor = Colors.black.withOpacity(0.5)
      ..indicatorColor = Colors.grey
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
