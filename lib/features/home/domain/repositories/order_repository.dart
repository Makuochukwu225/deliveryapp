import '../../../../export.dart';

class OrderRepository {
  final OrderDataSource dataSource;

  OrderRepository(this.dataSource);

  Future<List<OrderModel>> getOrderHistory1() async {
    return await dataSource.fetchOrderHistory1();
  }

  Future<List<OrderModel>> getOrderHistory2() async {
    return await dataSource.fetchOrderHistory2();
  }
}
