import 'dart:convert';

class SaveProductData {
  final String productName;
  final String customerName;
  final int mobileNumber;
  final int quantity;
  final double price;
  final double totalPrice;

  SaveProductData( {
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.customerName,
    required this.mobileNumber
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'totalPrice':totalPrice,
      'customerName':customerName,
      'mobileNumber':mobileNumber
    };
  }

  factory SaveProductData.fromMap(Map<String, dynamic> map) {
    return SaveProductData(
      productName: map['productName'] as String,
      quantity: (map['quantity'] as num).toInt(),
      price: (map['price'] as num).toDouble(),
      totalPrice: (map['totalPrice'] as num).toDouble(),
      customerName: map['customerName'] as String,
      mobileNumber: (map['mobileNumber'] as num).toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaveProductData.fromJson(String source) =>
      SaveProductData.fromMap(json.decode(source) as Map<String, dynamic>);
}
