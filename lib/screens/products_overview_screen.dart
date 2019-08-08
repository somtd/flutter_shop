import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/providers/products_provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContainer =
        Provider.of<ProductsProvider>(context, listen: false);
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions filterOption) {
              if (filterOption == FilterOptions.Favorites) {
                productContainer.showFavoriteOnly();
              } else {
                productContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              )
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
    return scaffold;
  }
}
