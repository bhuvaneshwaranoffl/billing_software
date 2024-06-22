import 'dart:convert';

class ProductFetch {
  final String productName;
  final int quantity;
  final double price;

  ProductFetch({
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

  factory ProductFetch.fromMap(Map<String, dynamic> map) {
    return ProductFetch(
      productName: map['productName'] as String,
      quantity: (map['quantity'] as num).toInt(),
      price: (map['price'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductFetch.fromJson(String source) =>
      ProductFetch.fromMap(json.decode(source) as Map<String, dynamic>);
}
