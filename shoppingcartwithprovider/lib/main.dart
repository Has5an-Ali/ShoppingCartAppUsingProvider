import 'package:flutter/material.dart';
import 'package:shoppingcartwithprovider/ProductList.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartwithprovider/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
      create: (__) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blue),
          home: const Productlistscreen(),
        );
      }),
    );
  }
}
