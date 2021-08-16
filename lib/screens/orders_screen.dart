import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/utilities/providers/orders.dart' show Orders;
import 'package:the_shop_practice/utilities/widgets/app_drawer.dart';
import 'package:the_shop_practice/utilities/widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  // const OrdersScreen({ Key? key }) : super(key: key);
  static const routename = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future _orders;
  Future _obtainOrderFuture() {
    return Provider.of<Orders>(context, listen: false).fetchhandSetOrders();
  }

  @override
  void initState() {
    // TODO: implement initState

    _orders = _obtainOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _orders,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('ERROR'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemBuilder: (ctx, i) => OrderItem(
                      orderData.orders[i],
                    ),
                    itemCount: orderData.orders.length,
                  ),
                );
              }
            }
          },
        ));
  }
}
