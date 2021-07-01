import 'package:flutter/material.dart';

import 'package:the_shop_practice/utilities/widgets/products_grid.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
        ),
        body: ProductsGrid());
  }
}
