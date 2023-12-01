import 'package:deliveryapp/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidgetButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Widget data;
  final double? fontSize;
  final Color? fontColor;
  const AppWidgetButton({
    Key? key,
    required this.onPressed,
    required this.data,
    this.fontSize = 16,
    this.fontColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          padding: EdgeInsets.all(12.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(52.r),
          ),
        ),
        onPressed: onPressed,
        child: data,
      ),
    );
  }
}
