import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/product_provider.dart';

class TotalProducts extends StatefulWidget {
  const TotalProducts({super.key});

  @override
  State<TotalProducts> createState() => _TotalProductsState();
}

class _TotalProductsState extends State<TotalProducts> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductProvider>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.leftSideColor,
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return ListTile(
                  title: Text(product.productName),
                  subtitle: Text('Quantity: ${product.quantity}'),
                  trailing: Text('Price: \$${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
