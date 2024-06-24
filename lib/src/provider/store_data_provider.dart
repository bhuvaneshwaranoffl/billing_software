// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:billingsoftware/src/models/store_product_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class StoreProductDataProvider extends ChangeNotifier {
//   List<StoreProductData> _storeProducts = [];

//   List<StoreProductData> get storeProducts => _storeProducts;

//   Future<void> fetchStoreProducts() async {
//     try {
//       final String response =
//           await rootBundle.loadString('assets/json/store_product_data.json');
//       final List<dynamic> data = json.decode(response);
//       _storeProducts =
//           data.map((item) => StoreProductData.fromMap(item)).toList();
//       notifyListeners();
//     } catch (e) {
//       print("Error loading store products: $e");
//     }
//   }

//   void addStoreProduct(StoreProductData storeProduct) {
//     _storeProducts.add(storeProduct);
//     notifyListeners();
//   }

//   void updateStoreProduct(int index, StoreProductData storeProduct) {
//     if (index >= 0 && index < _storeProducts.length) {
//       _storeProducts[index] = storeProduct;
//       notifyListeners();
//     }
//   }

//   void deleteStoreProduct(int index) {
//     if (index >= 0 && index < _storeProducts.length) {
//       _storeProducts.removeAt(index);
//       notifyListeners();
//     }
//   }

//   StoreProductData? getStoreProductByName(String name) {
//     return _storeProducts.firstWhere(
//       (product) => product.productName == name,
//       orElse: () => StoreProductData(
//         productName: '',
//         quantity: 0,
//         price: 0.0,
//         totalPrice: 0.0,
//         customerName: '',
//         mobileNumber: 0,
//       ),
//     );
//   }
// }
