import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericCard extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const GenericCard({
    super.key,
    required this.child,
    this.elevation = 2.0,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 2.0, // Default elevation or provided one
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: padding ??  EdgeInsets.all(16.sp),
        // Custom or default padding
        child: child, // Custom widget provided to the card
      ),
    );
  }
}
