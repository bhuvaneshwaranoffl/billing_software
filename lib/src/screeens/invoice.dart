import 'package:billingsoftware/src/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:billingsoftware/src/utlis/colors.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

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

  // void _addProduct(BuildContext context) {
  //  // var invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);
  //   var productProvider = Provider.of<ProductProvider>(context, listen: false);

  //   if (_selectedProductName != null && _selectedProductPrice > 0) {
  //     double quantity = double.tryParse(_quantityController.text.trim()) ?? 0.0;

  //     if (quantity > 0) {
  //       var customerName = _customerNameController.text;
  //       var mobileNumber = int.tryParse(_mobileNumberController.text) ?? 0;

  //       var product = productProvider.getProductByName(_selectedProductName!);

  //       if (product != null) {
  //         double totalPrice = quantity * _selectedProductPrice;

  //         var saveProductData = SaveProductData(
  //           productName: _selectedProductName!,
  //           quantity: quantity.toInt(),
  //           price: _selectedProductPrice,
  //           totalPrice: totalPrice,
  //           customerName: customerName,
  //           mobileNumber: mobileNumber,
  //         );

  //         //invoiceProvider.addProduct(saveProductData);

  //         // Clear the fields after adding a product
  //         _quantityController.clear();
  //         _quantityFocusNode.requestFocus();
  //       }
  //     } else {
  //       // Handle invalid input
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Invalid Input'),
  //           content: const Text('Please enter a valid quantity.'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }

  // void _finishBilling(BuildContext context) {
  //  // var invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);

  //   if (_customerNameController.text.isNotEmpty &&
  //       _mobileNumberController.text.isNotEmpty) {
  //     var customerName = _customerNameController.text;
  //     var mobileNumber = int.tryParse(_mobileNumberController.text) ?? 0;
  //     var products = invoiceProvider.invoiceData;

  //     if (products.isNotEmpty) {
  //       invoiceProvider.saveInvoice(
  //         customerName: customerName,
  //         mobileNumber: mobileNumber,
  //         products: products,
  //       );

  //       // Show a confirmation message or navigate to another page
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Billing Complete'),
  //           content: const Text('Invoice has been saved successfully.'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );

  //       // Clear the fields after finishing billing
  //       _customerNameController.clear();
  //       _mobileNumberController.clear();
  //     } else {
  //       // Handle no products added
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('No Products'),
  //           content:
  //               const Text('Please add products before finishing billing.'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } else {
  //     // Handle invalid input
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Invalid Input'),
  //         content: const Text('Please enter customer name and mobile number.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  // double _calculateTotal(List<SaveProductData> invoiceData) {
  //   double total = 0.0;
  //   for (var product in invoiceData) {
  //     total += product.totalPrice;
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
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
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Display customer name and mobile number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Customer Name:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mobile Number:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    // DataTable(
                    //   columns: const [
                    //     DataColumn(label: Text('Product Name')),
                    //     DataColumn(label: Text('Quantity')),
                    //     DataColumn(label: Text('Price')),
                    //     DataColumn(label: Text('Total Price')),
                    //   ],
                    //   rows: invoiceProvider.invoiceData.map((product) {
                    //     return DataRow(cells: [
                    //       DataCell(Text(product.productName)),
                    //       DataCell(Text(product.quantity.toString())),
                    //       DataCell(
                    //           Text('Rs ${product.price.toStringAsFixed(2)}')),
                    //       DataCell(Text(
                    //           'Rs ${product.totalPrice.toStringAsFixed(2)}')),
                    //     ]);
                    //   }).toList(),
                    // ),
                    Divider(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          minimumSize: const Size(100, 70)),
                      onPressed: () {
                      },
                      child: const Text(
                        "Clear billing",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          minimumSize: const Size(100, 70)),
                      onPressed: () {
                        
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      'Total: Rs 1000',
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
