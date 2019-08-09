import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = List.generate(
      40,
      (index) => Product(
          id: index,
          title: 'Item ${index + 1}',
          color: Colors.red,
          price: (index + 1) * 10));

  List<Product> get products => _products;

  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addOrRemoveProductCart(int id) {
    _products[id].isSold = !_products[id].isSold;
    if (_products[id].isSold == true) {
      _cartItems.add(_products[id]);
    } else {
      _cartItems.removeWhere((product) => product.id == id);
    }
    notifyListeners();
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += cartItems[i].price;
    }

    return totalPrice;
  }
}
