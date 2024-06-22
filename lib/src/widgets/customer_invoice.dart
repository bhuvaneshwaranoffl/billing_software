
// ignore_for_file: file_names

import 'package:billingsoftware/src/models/customer_model.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:flutter/material.dart';

class CustomerInvoice extends StatelessWidget {
  final List<Customer> customers;

  const CustomerInvoice({
    super.key,
    required this.customers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.leftSideColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text('Customer ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Total Amount')),
                  DataColumn(label: Text('Payment Status')),
                ],
                rows: customers.map((customer) {
                  // Determine text and color based on payment status
                  String paymentStatusText = customer.paid ? 'Paid' : 'Unpaid';
                  Color? paymentStatusColor =
                      customer.paid ? Colors.green : Colors.red;
              
                  return DataRow(cells: [
                    DataCell(Text(customer.id.toString())),
                    DataCell(Text(customer.name)),
                    DataCell(Text('Rs ${customer.totalAmount.toStringAsFixed(2)}')),
                    DataCell(
                      Text(paymentStatusText,
                          style: TextStyle(color: paymentStatusColor)),
                    ),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
