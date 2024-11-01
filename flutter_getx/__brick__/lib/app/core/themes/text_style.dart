import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextTheme {

  static var context = Get.context!;
  // Method to retrieve text styles based on context
  static TextStyle? displayBoldStyle() {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? displayMediumStyle() {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? displayStyle() {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Heading Styles
  static TextStyle? headingBoldStyle() {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? headingMediumStyle() {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? headingStyle() {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // SubHeading Styles
  static TextStyle? subHeadingBoldStyle() {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? subHeadingMediumStyle() {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? subHeadingStyle() {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Title Styles
  static TextStyle? titleBoldStyle() {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? titleMediumStyle() {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? titleStyle() {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Subtitle Styles
  static TextStyle? subtitleBoldStyle() {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? subtitleMediumStyle(BuildContext c) {
    return Theme.of(c).textTheme.titleLarge?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? subtitleStyle() {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Body Styles
  static TextStyle? bodyBoldStyle(BuildContext c) {
    return Theme.of(c).textTheme.bodyLarge?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? bodyMediumStyle({BuildContext? c}) {
    return Theme.of(c ?? context).textTheme.bodyLarge?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? bodyStyle() {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Label Styles
  static TextStyle? labelBoldStyle() {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? labelMediumStyle() {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? labelStyle() {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
    );
  }

  // Caption Styles
  static TextStyle? captionBoldStyle() {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle? captionMediumStyle() {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? captionStyle() {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
    );
  }
}
