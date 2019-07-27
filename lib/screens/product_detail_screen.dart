import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;

  // ProductDetailScreen(this.product);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    final loadedProduct = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(product.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(),
    );
  }
}
