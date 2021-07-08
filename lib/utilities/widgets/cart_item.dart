import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  // const CartItem({ Key? key }) : super(key: key);
  final String id;
  final double price;
  final int qty;
  final String title;
  CartItem({this.id, this.price, this.qty, this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(child: Text("₹ $price")),
            ),
          ),
          title: Text(title),
          subtitle: Text("Total: ₹ ${price * qty}"),
          trailing: Text("$qty x"),
        ),
      ),
    );
  }
}
