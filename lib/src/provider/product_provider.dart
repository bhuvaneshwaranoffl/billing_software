// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:billingsoftware/src/models/total_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TotalProductProvider extends ChangeNotifier {
  List<TotalProduct> _products = [];

  List<TotalProduct> get products => _products;

  TotalProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/total_product.json');
      final Map<String, dynamic> data = json.decode(response);

      _products = (data['products'] as List)
          .map((item) => TotalProduct.fromMap(item))
          .toList();
      notifyListeners();
    } catch (e) {
      print("Error loading products: $e");
    }
  }

  int getTotalProductCount() {
    return _products.length;
  }

  TotalProduct? getProductByName(String name) {
    return _products.firstWhere(
      (product) => product.productName == name,
      orElse: () => TotalProduct(productName: '', price: 0.0, quantity: 0),
    );
  }
}
