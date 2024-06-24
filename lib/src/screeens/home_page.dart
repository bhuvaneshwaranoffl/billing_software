import 'package:billingsoftware/src/screeens/dashboard_screen.dart';
import 'package:billingsoftware/src/screeens/invoice.dart';
import 'package:billingsoftware/src/screeens/product_entry/product_entry.dart';
import 'package:billingsoftware/src/screeens/total_product.dart';
import 'package:billingsoftware/src/utlis/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(width: 1, color: Colors.black26),
                  ),
                  color: Color.fromARGB(244, 236, 236, 236),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColor.cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 4,
                              offset: Offset(4, 4),
                            )
                          ],
                        ),
                        child:const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Row(
                            children: [
                              Icon(
                                Icons.wb_sunny_outlined,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Company Name")
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildNavItem(
                      icon: Icons.home_outlined,
                      label: "DashBoard",
                      index: 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildNavItem(
                      icon: Icons.receipt_long_outlined,
                      label: "Invoice",
                      index: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildNavItem(
                      icon: Icons.production_quantity_limits_outlined,
                      label: "Products Entry",
                      index: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // _buildNavItem(
                    //   icon: Icons.person_2_outlined,
                    //   label: "Customer Management",
                    //   index: 3,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    _buildNavItem(
                      icon: Icons.list,
                      label: "Total Products",
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),

            // Right full space screen
            Expanded(
              flex: 8,
              child: Container(
                color: AppColor.cardColor,
                child: IndexedStack(
                  index: _selectedIndex,
                  children: const [
                    DashBoardScreen(),
                    InvoicePage(),
                   // AddProductPage(),
                   ProductEntry(),
                   // CustomerManagement(),
                    TotalProducts()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : AppColor.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 4,
              offset: Offset(4, 4),
            )
          ],
        ),
        child: TextButton(
          onPressed: () => _onItemTapped(index),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.blue : Colors.black),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
