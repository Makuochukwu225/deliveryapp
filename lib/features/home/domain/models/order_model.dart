import 'package:deliveryapp/export.dart';

class OrderModel {
  String? icon;
  String? trackingId;
  String? status;
  Color? iconColor;
  String? time;
  String? location;
  OrderModel({
    this.icon,
    this.trackingId,
    this.status,
    this.iconColor,
    this.time,
    this.location,
  });
}
