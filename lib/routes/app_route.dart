import 'package:deliveryapp/configs/configs.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static push({
    required BuildContext context,
    required Widget child,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: AppConfigs.kAnimation,
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ));
  }

  static pushReplace({
    required BuildContext context,
    required Widget child,
  }) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: AppConfigs.kAnimation,
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ));
  }

  static pushRemoveAll({
    required BuildContext context,
    required Widget child,
  }) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: AppConfigs.kAnimation,
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        (_) => false);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
