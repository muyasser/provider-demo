import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final Color color;
  final int price;
  bool isSold;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.color,
    this.isSold = false,
  });
}
