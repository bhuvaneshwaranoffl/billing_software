
import 'package:billingsoftware/src/provider/invoice_provider.dart';
import 'package:billingsoftware/src/provider/product_provider.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:billingsoftware/src/widgets/customer_invoice.dart';
import 'package:billingsoftware/src/widgets/stock_management_widget.dart';
import 'package:billingsoftware/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<TotalProductProvider>(context);
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.leftSideColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 200,
                  width: 1100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Row(
                      children: [
                         CardWidget(
                          icon: Icons.person_2_outlined,
                          title: 'Customer',
                          subtitle:
                             invoiceProvider.calculateUniqueCustomers().toString()
                        ),
                        const SizedBox(width: 14),
                        CardWidget(
                          icon: Icons.production_quantity_limits_outlined,
                          title: 'Total Products',
                          subtitle:
                              productProvider.getTotalProductCount().toString(),
                        ),
                        const SizedBox(width: 14),
                        const CardWidget(
                          icon: Icons.trolley,
                          title: 'Total sales',
                          subtitle: '170',
                        ),
                        const SizedBox(width: 14),
                        const CardWidget(
                          icon: Icons.payment_sharp,
                          title: 'Payment total',
                          subtitle: 'Rs 12750',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        "Customer Invoice",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 770),
                      Text(
                        "Stock Alert",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child:const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomerInvoice(
                            //customers: [],
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: StockManagement(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
