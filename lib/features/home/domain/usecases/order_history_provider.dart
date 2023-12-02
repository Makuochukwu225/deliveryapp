import '../../../../export.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final dataSource = OrderDataSource();
  return OrderRepository(dataSource);
});

final orderList1Provider = FutureProvider<List<OrderModel>>((ref) async {
  final repository = ref.read(orderRepositoryProvider);
  return await repository.getOrderHistory1();
});

final orderList2Provider = FutureProvider<List<OrderModel>>((ref) async {
  final repository = ref.read(orderRepositoryProvider);
  return await repository.getOrderHistory2();
});
