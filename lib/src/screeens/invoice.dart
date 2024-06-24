import 'package:billingsoftware/src/models/product_model_fetch.dart'; // Import the correct ProductDetail
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:billingsoftware/src/provider/invoice_provider.dart';
import 'package:billingsoftware/src/provider/product_provider.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final List<ProductDetail> _addedProducts = [];
  String? _selectedProductName;
  double _selectedProductPrice = 0.0;

  late FocusNode _quantityFocusNode;
  late FocusNode _customerNameFocusNode;
  late FocusNode _mobileFocusNode;

  @override
  void initState() {
    super.initState();
    _quantityFocusNode = FocusNode();
    _customerNameFocusNode = FocusNode();
    _mobileFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _quantityFocusNode.dispose();
    _customerNameFocusNode.dispose();
    _mobileFocusNode.dispose();
    super.dispose();
  }

  void _addProductToInvoice() {
    if (_selectedProductName != null && _quantityController.text.isNotEmpty) {
      int quantity = int.parse(_quantityController.text);
      double totalPrice = _selectedProductPrice * quantity;

      ProductDetail product = ProductDetail(
        // Ensure you are using ProductDetail from product_model_fetch.dart
        productName: _selectedProductName!,
        quantity: quantity,
        price: _selectedProductPrice,
        totalPrice: totalPrice,
      );

      setState(() {
        _addedProducts.add(product); // Add product to local list
      });

      _selectedProductName = null;
      _selectedProductPrice = 0.0;
      _quantityController.clear();
    }
  }

  void _finishBilling(BuildContext context) {
    var invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);

    if (_customerNameController.text.isNotEmpty &&
        _mobileNumberController.text.isNotEmpty &&
        _addedProducts.isNotEmpty) {
      var customerName = _customerNameController.text;
      var mobileNumber = int.tryParse(_mobileNumberController.text) ?? 0;

      // Convert ProductDetail list to SaveProductData list
      List<SaveProductData> saveProducts = _addedProducts.map((product) {
        return SaveProductData(
          customerName: customerName,
          mobileNumber: mobileNumber,
          products: [product], // Wrap ProductDetail in a List<ProductDetail>
        );
      }).toList();

      invoiceProvider.saveInvoice(
        customerName: customerName,
        mobileNumber: mobileNumber,
        products: saveProducts,
      );

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Billing Complete'),
          content: const Text('Invoice has been saved successfully.'),
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

      setState(() {
        _customerNameController.clear();
        _mobileNumberController.clear();
        _addedProducts.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please enter customer name, mobile number, and add at least one product.'),
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

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<TotalProductProvider>(context);
    var products = productProvider.products;

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
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: _customerNameFocusNode,
                    controller: _customerNameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
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
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) {
                      _quantityFocusNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedProductName,
                    items: products.map((product) {
                      return DropdownMenuItem<String>(
                        value: product.productName,
                        child: Text(product.productName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProductName = value;
                        var product = productProvider.getProductByName(value!);
                        _selectedProductPrice = product?.price ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    focusNode: _quantityFocusNode,
                    controller: _quantityController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) {
                      _addProductToInvoice();
                    },
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: _selectedProductPrice.toStringAsFixed(2),
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Individual Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    readOnly: true,
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
                    // Display customer name and mobile number
                    Text(
                      'Customer Name: ${_customerNameController.text}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Mobile Number: ${_mobileNumberController.text}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12.0),
                    // DataTable to display added products
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Total Price')),
                      ],
                      rows: _addedProducts.map((product) {
                        return DataRow(cells: [
                          DataCell(Text(product.productName)),
                          DataCell(Text(product.quantity.toString())),
                          DataCell(
                              Text('Rs ${product.price.toStringAsFixed(2)}')),
                          DataCell(Text(
                              'Rs ${product.totalPrice.toStringAsFixed(2)}')),
                        ]);
                      }).toList(),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          minimumSize: const Size(100, 70)),
                      onPressed: () {
                        _finishBilling(context);
                      },
                      child: const Text(
                        "Finish Billing",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      //'Total: Rs ${_calculateTotal(invoiceProvider.invoiceData).toStringAsFixed(2)}',
                      "Rs 1000",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
