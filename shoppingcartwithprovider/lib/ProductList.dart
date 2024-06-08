// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badge;
// import 'package:shoppingcartwithprovider/cart_provider.dart';
// import 'package:shoppingcartwithprovider/cartmodel.dart';
// import 'package:shoppingcartwithprovider/cartscreen.dart';
// import 'package:shoppingcartwithprovider/db.dart';
// import 'package:provider/provider.dart';
// import 'package:get/get.dart';

// class Productlistscreen extends StatefulWidget {
//   const Productlistscreen({super.key});

//   @override
//   State<Productlistscreen> createState() => _ProductlistscreenState();
// }

// class _ProductlistscreenState extends State<Productlistscreen> {
//   // DBhelp? dbhelper = DBhelp();
//   DBHelper? dbHelper = DBHelper();

//   final List<String> productImage = [
//     'assets/images/peach.png',
//     'assets/images/apple.jpg',
//     'assets/images/banana.png',
//     'assets/images/mango.jpg',
//     'assets/images/orange.png',
//     'assets/images/grapes.png',
//     'assets/images/chery.png',
//   ];
//   final List<String> productName = [
//     "Peach",
//     "Apple",
//     "Banana",
//     "Mango",
//     "Orange",
//     "Grapes",
//     "Cherry"
//   ];

//   final List<String> productUnit = [
//     "KG",
//     "KG",
//     "Dorzen",
//     "KG",
//     "Dorzen",
//     "KG",
//     "KG"
//   ];

//   final List<int> productPrice = [400, 350, 180, 320, 200, 340, 500];

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//         centerTitle: true,
//         actions: [
//           InkWell(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => CartScreen()));
//             },
//             child: Center(
//               child: badge.Badge(
//                 showBadge: true,
//                 badgeContent: Consumer<CartProvider>(
//                   builder: (context, value, child) {
//                     return Text(value.getCounter().toString(),
//                         style: TextStyle(color: Colors.white));
//                   },
//                 ),
//                 child: Icon(Icons.shopping_bag_outlined),
//               ),
//             ),
//           ),
//           SizedBox(width: 20.0)
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: productName.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Image(
//                                 height: 100,
//                                 width: 100,
//                                 image: NetworkImage(
//                                     productImage[index].toString()),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       productName[index].toString(),
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       productUnit[index].toString() +
//                                           " " +
//                                           r"$" +
//                                           productPrice[index].toString(),
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: InkWell(
//                                         onTap: () {
//                                           print(index);
//                                           print(index);
//                                           print(productName[index].toString());
//                                           print(productPrice[index].toString());
//                                           print(productPrice[index]);
//                                           print('1');
//                                           print(productUnit[index].toString());
//                                           print(productImage[index].toString());

//                                           dbHelper!
//                                               .insert(Cart(
//                                                   id: index,
//                                                   productId: index.toString(),
//                                                   productName:
//                                                       productName[index]
//                                                           .toString(),
//                                                   initialPrice:
//                                                       productPrice[index],
//                                                   productPrice:
//                                                       productPrice[index],
//                                                   quantity: 1,
//                                                   unitTag: productUnit[index]
//                                                       .toString(),
//                                                   image: productImage[index]
//                                                       .toString()))
//                                               .then((value) {
//                                             cart.addTotalPrice(double.parse(
//                                                 productPrice[index]
//                                                     .toString()));
//                                             cart.addCounter();

//                                             final snackBar = SnackBar(
//                                               backgroundColor: Colors.green,
//                                               content: Text(
//                                                   'Product is added to cart'),
//                                               duration: Duration(seconds: 1),
//                                             );

//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(snackBar);
//                                           }).onError((error, stackTrace) {
//                                             print("error" + error.toString());
//                                             final snackBar = SnackBar(
//                                                 backgroundColor: Colors.red,
//                                                 content: Text(
//                                                     'Product is already added in cart'),
//                                                 duration: Duration(seconds: 1));

//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(snackBar);
//                                           });
//                                         },
//                                         child: Container(
//                                           height: 35,
//                                           width: 100,
//                                           decoration: BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           child: const Center(
//                                             child: Text(
//                                               'Add to cart',
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'cartmodel.dart';
import 'cartscreen.dart';
import 'db.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> productName = [
    "Peach",
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Grapes",
    "Cherry"
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];
  final List<int> productPrice = [400, 350, 180, 320, 200, 340, 500];

  final List<String> productImage = [
    'assets/images/peach.png',
    'assets/images/apple.jpg',
    'assets/images/banana.png',
    'assets/images/mango.jpg',
    'assets/images/orange.png',
    'assets/images/grapes.png',
    'assets/images/chery.png',
  ];

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: badge.Badge(
                showBadge: true,
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(value.getCounter().toString(),
                        style: TextStyle(color: Colors.white));
                  },
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                productImage[index].toString(),
                                width: 80,
                                height: 80,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productName[index].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      productUnit[index].toString() +
                                          " " +
                                          r"$" +
                                          productPrice[index].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 150,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            print(index);
                                            print(index);
                                            print(
                                                productName[index].toString());
                                            print(
                                                productPrice[index].toString());
                                            print(productPrice[index]);
                                            print('1');
                                            print(
                                                productUnit[index].toString());
                                            print(
                                                productImage[index].toString());

                                            dbHelper!
                                                .insert(Cart(
                                                    id: index,
                                                    productId: index.toString(),
                                                    productName:
                                                        productName[index]
                                                            .toString(),
                                                    initialPrice:
                                                        productPrice[index],
                                                    productPrice:
                                                        productPrice[index],
                                                    quantity: 1,
                                                    unitTag: productUnit[index]
                                                        .toString(),
                                                    image: productImage[index]
                                                        .toString()))
                                                .then((value) {
                                              cart.addTotalPrice(double.parse(
                                                  productPrice[index]
                                                      .toString()));
                                              cart.addCounter();

                                              final snackBar = SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                    'Product is added to cart'),
                                                duration: Duration(seconds: 1),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }).onError((error, stackTrace) {
                                              print("error" + error.toString());
                                              final snackBar = SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      'Product is already added in cart'),
                                                  duration:
                                                      Duration(seconds: 1));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            });
                                          },
                                          child: Text(
                                            "Add To Cart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
