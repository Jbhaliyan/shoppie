import 'package:flutter/material.dart';
import 'package:the_shop_practice/screens/products_overview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.limeAccent,
        fontFamily: 'Lato',
      ),
      home: ProductOverview(),
    );
  }
}
