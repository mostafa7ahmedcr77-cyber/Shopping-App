import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/home/data/models/order_model.dart';

class OrderRepository {
  static const String ordersKey = 'saved_orders';

  static final List<OrderModel> orders = [];

  static int orderCounter = 1000;

  static Future<void> loadOrders() async {
    final prefs = await SharedPreferences.getInstance();

    final savedOrders = prefs.getStringList(ordersKey);

    orders.clear();

    if (savedOrders != null) {
      for (final orderJson in savedOrders) {
        final orderMap = jsonDecode(orderJson);

        orders.add(OrderModel.fromJson(orderMap));
      }
    }

    if (orders.isNotEmpty) {
      final lastNumber = int.tryParse(
        orders.first.orderNumber.replaceAll('#SU', ''),
      );

      if (lastNumber != null && lastNumber > orderCounter) {
        orderCounter = lastNumber;
      }
    }
  }

  static Future<void> saveOrders() async {
    final prefs = await SharedPreferences.getInstance();

    final savedOrders = orders.map((order) {
      return jsonEncode(order.toJson());
    }).toList();

    await prefs.setStringList(ordersKey, savedOrders);
  }

  static Future<void> addOrder({
    required int itemsCount,
    required double totalAmount,
  }) async {
    orderCounter++;

    final order = OrderModel(
      orderNumber: '#SU$orderCounter',
      orderDate: DateTime.now(),
      itemsCount: itemsCount,
      totalAmount: totalAmount,
      status: 'Pending',
    );

    orders.insert(0, order);

    await saveOrders();
  }

  static List<OrderModel> getOrders() {
    return List.unmodifiable(orders);
  }
}
