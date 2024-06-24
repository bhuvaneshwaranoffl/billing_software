// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String productName, double price)? onScanResult;

  const QRScannerWidget({super.key, this.onScanResult});

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  Future<void> _scanQR() async {
    try {
      String qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color for Android toolbar
        'Cancel', // Button text for Android
        true, // Whether to show flash icon
        ScanMode.QR, // Scan mode (QR, BARCODE, etc.)
      );

      if (qrCode != '-1' && widget.onScanResult != null) {
        List<String> data = qrCode.split(',');
        if (data.length == 2) {
          String productName = data[0];
          double price = double.tryParse(data[1]) ?? 0.0;
          widget.onScanResult!(productName, price);
        }
      }
    } catch (e) {
      // Handle errors
      print('Error scanning QR code: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _scanQR();
      },
      child: const Text('Scan QR'),
    );
  }
}
