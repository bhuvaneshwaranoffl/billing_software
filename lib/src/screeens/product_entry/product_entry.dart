import 'package:billingsoftware/src/screeens/product_entry/add_products_page.dart';
import 'package:billingsoftware/src/screeens/product_entry/update_product.dart';
import 'package:flutter/material.dart';

class ProductEntry extends StatelessWidget {
  const ProductEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Colors.black,
                  minimumSize: const Size(100, 70)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProductPage()));
              },
              child: const Text(
                "Add New Product",
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              width:20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Colors.black,
                  minimumSize: const Size(100, 70)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProductPage()));
              },
              child: const Text(
                "Update product",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
