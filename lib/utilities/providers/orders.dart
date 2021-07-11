import 'package:flutter/foundation.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amt;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem({
    @required this.amt,
    @required this.dateTime,
    @required this.id,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

// to insert the products in cart  to orders list
  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amt: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
