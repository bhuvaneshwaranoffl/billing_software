import 'package:billingsoftware/src/models/customer_model.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:billingsoftware/src/widgets/customer_invoice.dart';
import 'package:billingsoftware/src/widgets/stock_management_widget.dart';
import 'package:billingsoftware/src/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 23),
                    child: Row(
                      children: [
                        CardWidget(
                          icon: Icons.person_2_outlined,
                          title: 'Customer',
                          subtitle: '1000',
                        ),
                        SizedBox(width: 14),
                        CardWidget(
                          icon: Icons.production_quantity_limits_outlined,
                          title: 'Total Products',
                          subtitle: '170',
                        ),
                        SizedBox(width: 14),
                        CardWidget(
                          icon: Icons.trolley,
                          title: 'Total sales',
                          subtitle: '170',
                        ),
                        SizedBox(width: 14),
                        CardWidget(
                          icon: Icons.payment_sharp,
                          title: 'Payment total',
                          subtitle: 'Rs 12750',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Customer Invoice",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width:770,
                        ),
                        Text(
                          "Stock Alert",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 500,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomerInvoice(
                            customers: [
                              Customer(
                                  id: 1,
                                  name: 'John Doe',
                                  totalAmount: 5000,
                                  paid: true),
                              Customer(
                                  id: 2,
                                  name: 'Jane Smith',
                                  totalAmount: 3500,
                                  paid: false),
                              Customer(
                                  id: 3,
                                  name: 'Alice Johnson',
                                  totalAmount: 4500,
                                  paid: true),
                              Customer(
                                  id: 4,
                                  name: 'Bob Williams',
                                  totalAmount: 3000,
                                  paid: true),
                              Customer(
                                  id: 5,
                                  name: 'Emily Brown',
                                  totalAmount: 6000,
                                  paid: false),
                              Customer(
                                  id: 6,
                                  name: 'Michael Davis',
                                  totalAmount: 7000,
                                  paid: true),
                              Customer(
                                  id: 7,
                                  name: 'Olivia Wilson',
                                  totalAmount: 5500,
                                  paid: false),
                              Customer(
                                  id: 8,
                                  name: 'James Taylor',
                                  totalAmount: 4000,
                                  paid: true),
                              Customer(
                                  id: 9,
                                  name: 'Sophia Martinez',
                                  totalAmount: 4800,
                                  paid: true),
                              Customer(
                                  id: 10,
                                  name: 'William Anderson',
                                  totalAmount: 5200,
                                  paid: false),
                              Customer(
                                  id: 11,
                                  name: 'Isabella Thomas',
                                  totalAmount: 3700,
                                  paid: true),
                              Customer(
                                  id: 12,
                                  name: 'Alexander Garcia',
                                  totalAmount: 4300,
                                  paid: false),
                              Customer(
                                  id: 13,
                                  name: 'Mia Hernandez',
                                  totalAmount: 6200,
                                  paid: true),
                              Customer(
                                  id: 14,
                                  name: 'Benjamin Moore',
                                  totalAmount: 5800,
                                  paid: false),
                              Customer(
                                  id: 15,
                                  name: 'Ella Parker',
                                  totalAmount: 4900,
                                  paid: true),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 500,
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
