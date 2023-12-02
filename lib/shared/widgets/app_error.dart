import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String data;
  const AppError({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
