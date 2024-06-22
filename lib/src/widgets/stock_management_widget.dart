// ignore_for_file: file_names
import 'package:billingsoftware/src/controller/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:billingsoftware/src/utlis/colors.dart';

class StockManagement extends StatelessWidget {
  const StockManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Stock Management'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.leftSideColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, _) {
              if (productProvider.products.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Quantity')),
                      ],
                      rows: productProvider.products.map((product) {
                        return DataRow(cells: [
                          DataCell(Text(product.productName)),
                          DataCell(Text(product.quantity.toString())),
                        ]);
                      }).toList(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
