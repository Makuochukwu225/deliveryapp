import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;

  final TextAlign? textAlign;
  const AppText({
    Key? key,
    required this.data,
    this.color,
    this.fontWeight,
    this.fontSize = 16,
    this.textAlign,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        data,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize!.sp,
          height: height,
          // fontStyle: FontStyle.normal,
          fontFamily: "SfpProDisplay",
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
