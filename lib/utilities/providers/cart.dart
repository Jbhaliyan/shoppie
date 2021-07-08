import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int qty;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.qty,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmt {
    double total = 0.0;
    _items.forEach(
      (key, value) {
        total += value.price * value.qty;
      },
    );
    return total;
  }

  void addItems(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // change qty
      _items.update(
        productId,
        (exisitingCartItem) => CartItem(
          id: exisitingCartItem.id,
          title: exisitingCartItem.title,
          price: exisitingCartItem.price,
          qty: exisitingCartItem.qty + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
