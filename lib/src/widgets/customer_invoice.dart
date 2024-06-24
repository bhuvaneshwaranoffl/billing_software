import 'package:billingsoftware/src/provider/invoice_provider.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerInvoice extends StatelessWidget {
  //final List<Customer> customers;

  const CustomerInvoice({
    super.key,
  //  required this.customers,
  });

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          //padding: const EdgeInsets.all(20),
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
                 // DataColumn(label: Text('Payment Status')),
                ],
                rows: [
                  // Determine text and color based on payment status
                  // String paymentStatusText = customer.paid ? 'Paid' : 'Unpaid';
                  // Color? paymentStatusColor =
                  //     customer.paid ? Colors.green : Colors.red;
              
                   DataRow(cells: [
                    const DataCell(Text("1"
                      )),
                    DataCell(Text(
                      invoiceProvider.customerName)),
                    DataCell(Text(
                      invoiceProvider.mobileNumber.toString())),
                    // DataCell(
                    //   Text(paymentStatusText,
                    //       style: TextStyle(color: paymentStatusColor)),
                    // ),
                  ])]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
