// ignore_for_file: avoid_print, dead_code

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

  int calculateUniqueCustomers() {
    // Use a Set to store unique customer names
    Set<String> uniqueCustomers = <String>{};

    // Iterate through _invoiceData and add customer names to the Set
    for (var invoice in _invoiceData) {
      uniqueCustomers.add(invoice.customerName);
    }

    // Return the size of the Set which represents the number of unique customers
    return uniqueCustomers.length;
    print(uniqueCustomers.length);
  }
}
