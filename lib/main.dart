import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/screens/orders_screen.dart';
import 'package:the_shop_practice/screens/product_detail_screen.dart';
import 'package:the_shop_practice/screens/products_overview.dart';
import 'package:the_shop_practice/utilities/providers/cart.dart';
import 'package:the_shop_practice/utilities/providers/products_provider.dart';

import 'screens/cart_screen.dart';
import 'utilities/providers/orders.dart' as od;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              Products(), //only widgets who are listening will rebuild.
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => od.Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.blueGrey,
          fontFamily: 'Lato',
        ),
        home: ProductOverview(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routename: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
