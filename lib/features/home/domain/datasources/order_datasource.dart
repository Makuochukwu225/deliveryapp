import '../../../../export.dart';

class OrderDataSource {
  Future<List<OrderModel>> fetchOrderHistory1() async {
    // Simulated network call
    await Future.delayed(AppConfigs.kSimulateApiDuration);

    // Simulated response data
    final List<OrderModel> orderHistoryList1 = [
      OrderModel(
        trackingId: "SCP9374826473",
        icon: "assets/icons/box.png",
        status: "In the process",
      ),
      OrderModel(
        trackingId: "SCP6653728497",
        icon: "assets/icons/lorry.png",
        status: "In delivery",
      ),
    ];

    return orderHistoryList1;
  }

  Future<List<OrderModel>> fetchOrderHistory2() async {
    // Simulated network call
    await Future.delayed(AppConfigs.kSimulateApiDuration);

    // Simulated response data
    final List<OrderModel> orderHistoryList2 = [
      OrderModel(
          trackingId: "SCP9374826473",
          icon: "assets/icons/lorry.png",
          status: "In Delivery",
          location: "Bali, Indonesia",
          time: "00.00 PM",
          iconColor: AppColors.primary),
      OrderModel(
          trackingId: "SCP6653728497",
          icon: "assets/icons/transit.png",
          status: "Transit - Sending City",
          location: "Jakarta, Indonesia",
          time: "21.00 PM",
          iconColor: AppColors.blueLight),
      OrderModel(
          trackingId: "SCP6653728497",
          icon: "assets/icons/box.png",
          status: "Send Form Sukabumi",
          location: "Sukabumi, Indonesia",
          time: "19.00 PM",
          iconColor: AppColors.blueLight),
    ];

    return orderHistoryList2;
  }
}
