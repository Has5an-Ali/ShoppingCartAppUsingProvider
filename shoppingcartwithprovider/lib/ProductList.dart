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
  final List<String> imagePaths = [
    'assets/images/peach.png',
    'assets/images/apple.jpg',
    'assets/images/banana.png',
    'assets/images/mango.jpg',
    'assets/images/orange.png',
    'assets/images/grapes.png',
    'assets/images/chery.png',
  ];
  final List<String> productname = [
    "Peach",
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Grapes",
    "Cherry"
  ];

  final List<String> productunit = [
    "KG",
    "KG",
    "Dorzen",
    "KG",
    "Dorzen",
    "KG",
    "KG"
  ];

  final List<int> productprice = [400, 350, 180, 320, 200, 340, 500];

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
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              imagePaths[index],
                              width: 115,
                              height: 115,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productname[index]),
                                  Row(
                                    children: [
                                      Text(productprice[index].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(productunit[index])
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
