import 'package:{{project_name}}/app/core/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlertManager {
  static void showErrorAlert(String message) {
    Get.snackbar(
      'Oops!', // Title
      message, // Message
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      // Light red background
      colorText: Colors.white,
      // White text color
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 30.sp,
      ),
      // Error icon
      margin: EdgeInsets.all(10.sp),
      borderRadius: 12.r,
      // Rounded corners for a soft look
      duration: const Duration(milliseconds: 1500),
      // Display for 4 seconds
      shouldIconPulse: true,
      // Icon animation
      barBlur: 4.r,
      // Background blur for focus
      overlayBlur: 1.r,
      // Slight overlay blur to emphasize the snackbar
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'DISMISS',
          style: AppTextTheme.bodyBoldStyle(Get.context!)
              ?.copyWith(color: Colors.white),
        ),
      ),
      // Add a dismiss button
      snackStyle: SnackStyle.FLOATING,
      // Floating above content for elegance
      isDismissible: true, // Can be dismissed by the user
    );
  }
}
