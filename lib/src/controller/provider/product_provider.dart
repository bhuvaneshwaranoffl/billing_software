import 'dart:convert';
import 'package:billingsoftware/src/models/product_model_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductFetch> _products = [];

  List<ProductFetch> get products => _products;

  Future<void> fetchProducts() async {
    final String response =
        await rootBundle.loadString('assets/json/total_product.json');
    final Map<String, dynamic> data = json.decode(response);

    _products = (data['products'] as List)
        .map((item) => ProductFetch.fromMap(item))
        .toList();
    notifyListeners();
  }
}
