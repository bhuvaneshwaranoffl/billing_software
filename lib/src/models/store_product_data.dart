import 'dart:convert';

class StoreProductData {
  final String customerName;
  final int mobileNumber;
  final List<ProductDetail> products;

  StoreProductData({
    required this.customerName,
    required this.mobileNumber,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerName': customerName,
      'mobileNumber': mobileNumber,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }

  factory StoreProductData.fromMap(Map<String, dynamic> map) {
    return StoreProductData(
      customerName: map['customerName'] as String,
      mobileNumber: map['mobileNumber'] as int,
      products: List<ProductDetail>.from((map['products'] as List<dynamic>)
          .map<ProductDetail>(
              (item) => ProductDetail.fromMap(item as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreProductData.fromJson(String source) =>
      StoreProductData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductDetail {
  final String productName;
  final int quantity;
  final double price;
  final double totalPrice;

  ProductDetail({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
    };
  }

  factory ProductDetail.fromMap(Map<String, dynamic> map) {
    return ProductDetail(
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: (map['price'] as num).toDouble(),
      totalPrice: (map['totalPrice'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetail.fromJson(String source) =>
      ProductDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
