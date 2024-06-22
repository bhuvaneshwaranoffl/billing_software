// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  final int id;
  final String name;
  final double totalAmount;
  final bool paid; // Added boolean field for payment status

  Customer({
    required this.id,
    required this.name,
    required this.totalAmount,
    required this.paid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'totalAmount': totalAmount,
      'paid': paid,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as int,
      name: map['name'] as String,
      totalAmount: map['totalAmount'] as double,
      paid: map['paid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
