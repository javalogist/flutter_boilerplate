import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:{{project_name}}/app/core/themes/text_style.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String imagePath; // Path to the image asset

  CustomDialogWidget({
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r), // Rounded corners
      ),
      child: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(), // Close the dialog
                child: Icon(Icons.close_rounded, color: Colors.black),
              ),
            ),
            SizedBox(height: 8.h),
            SvgPicture.asset(
              imagePath,
              width: 148.sp,
              height: 148.sp,
            ),
            SizedBox(height: 16.h),
            Text(title, style: AppTextTheme.subHeadingBoldStyle(),textAlign: TextAlign.center,),
            SizedBox(height: 8.h),
            Text(message,
                textAlign: TextAlign.center,
                style:
                    AppTextTheme.bodyStyle()?.copyWith(color: Colors.grey[700])),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
              ),
              child: Text(buttonText,
                  style: AppTextTheme.bodyStyle()?.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
