import 'package:deliveryapp/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class WayaaButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String data;
  final double? fontSize;
  final Color? fontColor;
  const WayaaButton({
    Key? key,
    required this.onPressed,
    required this.data,
    this.fontSize = 16,
    this.fontColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: AppText(
          data: data,
          fontSize: fontSize,
          color: fontColor ?? AppColors.white,
        ),
      ),
    );
  }
}
