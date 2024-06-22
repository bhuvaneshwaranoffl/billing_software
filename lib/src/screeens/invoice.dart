import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  final List<Map<String, dynamic>> _products = [];

  late FocusNode _productNameFocusNode;
  late FocusNode _quantityFocusNode;
  late FocusNode _priceFocusNode;
  late FocusNode _customerNameFocusNode;
  late FocusNode _mobileFocusNode;

  @override
  void initState() {
    super.initState();
    _productNameFocusNode = FocusNode();
    _quantityFocusNode = FocusNode();
    _priceFocusNode = FocusNode();
    _customerNameFocusNode = FocusNode();
    _mobileFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _productNameFocusNode.dispose();
    _quantityFocusNode.dispose();
    _priceFocusNode.dispose();
    _customerNameFocusNode.dispose();
    _mobileFocusNode.dispose();
    super.dispose();
  }

  void _addProduct() {
    String productName = _productNameController.text.trim();
    double quantity = double.tryParse(_quantityController.text.trim()) ?? 0.0;
    double price = double.tryParse(_priceController.text.trim()) ?? 0.0;

    if (productName.isNotEmpty && quantity > 0 && price > 0) {
      setState(() {
        _products.add({
          'productName': productName,
          'quantity': quantity,
          'price': price,
        });

        // Clear the text fields after adding a product
        _productNameController.clear();
        _quantityController.clear();
        _priceController.clear();
        _customerNameController.clear();
        _mobileNumberController.clear();
      });

      // Focus back on product name field after adding product
      _customerNameFocusNode.requestFocus();
    } else {
      // Handle invalid input
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter valid product details.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  double _calculateTotal() {
    double total = 0.0;
    for (var product in _products) {
      total += product['quantity'] * product['price'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.leftSideColor,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColor.leftSideColor,
        title: const Text('Billing Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
               Expanded(
                flex: 6,
                  child: TextField(
                    focusNode: _customerNameFocusNode,
                    controller: _customerNameController,
                    decoration: InputDecoration(
                      labelText: 'Customer Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (_) {
                      _mobileFocusNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    focusNode: _mobileFocusNode,
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (_) {
                      _productNameFocusNode.requestFocus();
                    },
                  ),
                ),
            ],),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _productNameFocusNode,
                    controller: _productNameController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (_) {
                      _quantityFocusNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    focusNode: _quantityFocusNode,
                    controller: _quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) {
                      _priceFocusNode.requestFocus();
                    },
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    focusNode: _priceFocusNode,
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) {
                      _addProduct();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Price')),
                      ],
                      rows: _products.map((product) {
                        return DataRow(cells: [
                          DataCell(Text(product['productName'])),
                          DataCell(Text(product['quantity'].toString())),
                          DataCell(
                              Text('Rs ${product['price'].toStringAsFixed(2)}')),
                        ]);
                      }).toList(),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Text(
                  'Total: Rs ${_calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
