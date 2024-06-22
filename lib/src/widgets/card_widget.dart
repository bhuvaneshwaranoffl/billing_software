import 'package:flutter/material.dart';
import 'package:billingsoftware/src/utlis/colors.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        color: AppColor.leftSideColor,
        borderRadius: BorderRadius.circular(20),
        // boxShadow:const [
        //   BoxShadow(
        //     color: Color.fromARGB(106, 0, 0, 0),
        //     blurRadius: 5,
        //     spreadRadius: 4,
        //     offset: Offset(0, 4)            
        //   )
        // ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
