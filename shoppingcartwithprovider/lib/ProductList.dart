// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:shoppingcartwithprovider/Productimagelist.dart';

class Productlistscreen extends StatefulWidget {
  const Productlistscreen({super.key});

  @override
  State<Productlistscreen> createState() => _ProductlistscreenState();
}

class _ProductlistscreenState extends State<Productlistscreen> {
  List productimage = [apple, mango, banana, cherry, grapes, orange, peach];
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: productimage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              productimage[index],
                              width: 115,
                              height: 115,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Orange"),
                                Row(
                                  children: [Text("Kg"), Text("200")],
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Add To Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
