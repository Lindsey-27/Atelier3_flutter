import 'package:exercice_flutter/pages/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _items = [];

  List<Product> get items => _items;

  double get total => _items.fold(0, (sum, item) => sum + item.price);
  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

}