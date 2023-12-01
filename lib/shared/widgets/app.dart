import 'package:deliveryapp/configs/app_configs.dart';
import 'package:deliveryapp/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConfigs.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: const LoginScreen(),
        title: AppConfigs.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
