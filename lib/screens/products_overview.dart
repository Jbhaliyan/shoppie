import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/utilities/providers/cart.dart';
import 'package:the_shop_practice/utilities/widgets/app_drawer.dart';
import 'package:the_shop_practice/utilities/widgets/badge.dart';
// import 'package:provider/provider.dart';
// import 'package:the_shop_practice/utilities/providers/products_provider.dart';

import 'package:the_shop_practice/utilities/widgets/products_grid.dart';

import 'cart_screen.dart';

enum Filters {
  Favourites,
  All,
}

class ProductOverview extends StatefulWidget {
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool _showOnlyFavourite = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: [
            PopupMenuButton(
              onSelected: (Filters selectedValue) {
                print(selectedValue);
                setState(() {
                  if (selectedValue == Filters.Favourites) {
                    // ..
                    _showOnlyFavourite = true;
                    // productsContainer.showFavourite();
                  } else {
                    // ..
                    _showOnlyFavourite = false;
                    // productsContainer.showAll();
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favourite'),
                  value: Filters.Favourites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: Filters.All,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                child: ch, //consumer's child "ch" is passed as badge's child.
                value: cartData.itemCount.toString(),
              ),
              // consumer's child widget
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(_showOnlyFavourite));
  }
}
