import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/screens/product_detail_screen.dart';
import 'package:the_shop_practice/screens/products_overview.dart';
import 'package:the_shop_practice/utilities/providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) =>
          Products(), //only widgets who are listening will rebuild.
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.limeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverview(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
