import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0.0;
  double get totalprice => _totalprice;

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalprice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _counter = prefs.getInt('cart_item') ?? 0;
    _totalprice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
}