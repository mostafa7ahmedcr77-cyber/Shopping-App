class OrderModel {
  final String orderNumber;
  final DateTime orderDate;
  final int itemsCount;
  final double totalAmount;
  final String status;

  const OrderModel({
    required this.orderNumber,
    required this.orderDate,
    required this.itemsCount,
    required this.totalAmount,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderNumber': orderNumber,
      'orderDate': orderDate.toIso8601String(),
      'itemsCount': itemsCount,
      'totalAmount': totalAmount,
      'status': status,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNumber: json['orderNumber'],
      orderDate: DateTime.parse(json['orderDate']),
      itemsCount: json['itemsCount'],
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'],
    );
  }
}
