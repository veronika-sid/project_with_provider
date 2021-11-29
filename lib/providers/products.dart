import 'package:flutter/cupertino.dart';
import 'package:project_with_provider/models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];
  int _totalCost = 0;

  List<Product> get items {
    return [..._items];
  }

  void addProductToBasket(Product product) {
    notifyListeners();
    _items.add(product);
  }

  int get totalCost {
    _totalCost = 0;
    for (var element in _items) {
      _totalCost = _totalCost + element.price;
    }
    return _totalCost;
  }
}
