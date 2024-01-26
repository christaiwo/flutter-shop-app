import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> carts = [];

  void addProduct(Map<String, dynamic> product) {
    carts.add(product);
  }

  void removeProduct(Map<String, dynamic> product) {
    carts.remove(product);
  }
}
