// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shoppingcartwithprovider/cartmodel.dart';
// import 'package:shoppingcartwithprovider/db.dart';

// class CartProvider with ChangeNotifier {
//   DBhelp db = DBhelp();
//   int _counter = 0;
//   int get counter => _counter;

//   double _totalprice = 0.0;
//   double get totalprice => _totalprice;

//   late Future<List<Cart>> _cart;
//   Future<List<Cart>> get cart => _cart;

//   Future<List<Cart>> getData() async {
//     _cart = db.getCartList();
//     return _cart;
//   }

//   void _setPrefItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.setInt('cart_item', _counter);
//     prefs.setDouble('total_price', _totalprice);
//     notifyListeners();
//   }

//   void _getPrefItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     _counter = prefs.getInt('cart_item') ?? 0;
//     _totalprice = prefs.getDouble('total_price') ?? 0.0;
//     notifyListeners();
//   }

//   void addTotalPrice(double productPrice) {
//     _totalprice = _totalprice + productPrice;
//     _setPrefItems();
//     notifyListeners();
//   }

//   void removeTotalPrice(double productPrice) {
//     _totalprice = _totalprice + productPrice;
//     _setPrefItems();
//     notifyListeners();
//   }

//   double getTotalPrice() {
//     _getPrefItems();
//     return _totalprice;
//   }

//   void addCounter() {
//     _counter++;
//     _setPrefItems();
//     notifyListeners();
//   }

//   void removeCounter() {
//     _counter--;
//     _setPrefItems();
//     notifyListeners();
//   }

//   int getCounter() {
//     _getPrefItems();
//     return _counter;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cartmodel.dart';
import 'db.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
