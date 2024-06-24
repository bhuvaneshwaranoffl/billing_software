import 'dart:convert';

class TotalProduct {
  final String productName;
  final int quantity;
  final double price;

  TotalProduct({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }

  factory TotalProduct.fromMap(Map<String, dynamic> map) {
    return TotalProduct(
      productName: map['productName'] as String,
      quantity: (map['quantity'] as num).toInt(),
      price: (map['price'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalProduct.fromJson(String source) =>
      TotalProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
