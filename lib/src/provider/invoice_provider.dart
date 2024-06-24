// ignore_for_file: avoid_print

import 'package:billingsoftware/src/models/product_model_fetch.dart';
import 'package:flutter/material.dart';

class InvoiceProvider with ChangeNotifier {
  String _customerName = '';
  int _mobileNumber = 0;
  List<SaveProductData> _invoiceData = [];

  String get customerName => _customerName;
  int get mobileNumber => _mobileNumber;
  List<SaveProductData> get invoiceData => _invoiceData;

  void addProduct(SaveProductData product) {
    _invoiceData.add(product);
    print('Product added: ${product.toMap()}'); // Print the added product
    notifyListeners();
  }

  void saveInvoice({
    required String customerName,
    required int mobileNumber,
    required List<SaveProductData> products,
  }) {
    _customerName = customerName;
    _mobileNumber = mobileNumber;
    _invoiceData = products;
    print('Invoice saved:');
    print('Customer Name: $_customerName');
    print('Mobile Number: $_mobileNumber');
    for (var product in _invoiceData) {
      print(product.toMap());
    } // Print each product
    notifyListeners();
  }

  void clearInvoice() {
    _customerName = '';
    _mobileNumber = 0;
    _invoiceData = [];
    print('Invoice cleared');
    notifyListeners();
  }

  // Method to print the current state of the invoice data
  // void printInvoiceData() {
  //   print('Current Invoice Data:');
  //   print('Customer Name: $_customerName');
  //   print('Mobile Number: $_mobileNumber');
  //   _invoiceData.forEach((product) => print(product.toMap()));
  // }
}
