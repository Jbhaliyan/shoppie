import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/utilities/providers/cart.dart' show Cart;
import 'package:the_shop_practice/utilities/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({ Key? key }) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(14),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  // SizedBox(width: 10),
                  Chip(
                    label: Text(
                      '₹${cart.totalAmt}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                  id: cart.items.values.toList()[i].id,
                  title: cart.items.values.toList()[i].title,
                  price: cart.items.values.toList()[i].price,
                  qty: cart.items.values.toList()[i].qty),
            ),
          ),
        ],
      ),
    );
  }
}
