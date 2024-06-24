import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String message;

  const CustomToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow:const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 17,
              spreadRadius: 3,
              offset:Offset(0, 4)
            )
          ]
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 16.0,fontWeight:FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
