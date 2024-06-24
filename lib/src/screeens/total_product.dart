import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../utlis/colors.dart';

class TotalProducts extends StatefulWidget {
  const TotalProducts({super.key});

  @override
  State<TotalProducts> createState() => _TotalProductsState();
}

class _TotalProductsState extends State<TotalProducts> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the widget initializes
    Future.microtask(() =>
        Provider.of<ProductProvider>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.leftSideColor,
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Product Name')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Price')),
                    ],
                    rows: productProvider.products.map((product) {
                      return DataRow(cells: [
                        DataCell(Text(product.productName)),
                        DataCell(Text(product.quantity.toString())),
                        DataCell(Text(product.price.toString())),
                      ]);
                    }).toList(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
