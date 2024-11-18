import 'package:flutter/material.dart';
import '../models/product.dart';

class CartService with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void placeOrder() {
    // Logic for order placement (Viber API integration)
    _items.clear();
    notifyListeners();
  }
}
