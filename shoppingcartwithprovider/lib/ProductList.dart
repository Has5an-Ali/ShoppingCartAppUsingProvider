import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class Productlistscreen extends StatefulWidget {
  const Productlistscreen({super.key});

  @override
  State<Productlistscreen> createState() => _ProductlistscreenState();
}

class _ProductlistscreenState extends State<Productlistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: const [
          badge.Badge(
            badgeContent: Text(
              '0',
              style: TextStyle(color: Colors.white),
            ),
            badgeAnimation: badge.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1)),
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
