import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ProductList.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => ProductListScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.to(ProductListScreen());
    return Scaffold(
      body: Text(
        "Shopping Cart \n With Provider",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
