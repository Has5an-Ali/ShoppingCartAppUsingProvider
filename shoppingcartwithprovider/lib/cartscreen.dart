// import 'package:flutter/material.dart';
// import 'package:shoppingcartwithprovider/cart_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:badges/badges.dart' as badge;
// import 'package:shoppingcartwithprovider/cartmodel.dart';
// import 'package:shoppingcartwithprovider/db.dart';

// // class CartScreen extends StatefulWidget {
// //   const CartScreen({
// //     super.key,
// //   });

// //   @override
// //   State<CartScreen> createState() => _CartScreenState();
// // }

// // class _CartScreenState extends State<CartScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final cart = Provider.of<CartProvider>(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           "Product List",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.green,
// //         centerTitle: true,
// //         actions: [
// //           badge.Badge(
// //             badgeContent: Consumer<CartProvider>(
// //               builder: (context, value, child) {
// //                 return Text(
// //                   value.getCounter().toString(),
// //                   style: TextStyle(color: Colors.white),
// //                 );
// //               },
// //             ),
// //             badgeAnimation: badge.BadgeAnimation.rotation(
// //                 animationDuration: Duration(seconds: 1)),
// //             child: Icon(Icons.shopping_cart),
// //           ),
// //           SizedBox(
// //             width: 20,
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           FutureBuilder(
// //               future: cart.getData(),
// //               builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
// //                 if (snapshot.hasData) {
// //                   return Expanded(
// //                     child: ListView.builder(
// //                       itemCount: snapshot.data!.length,
// //                       itemBuilder: (BuildContext context, int index) {
// //                         return Card(
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 children: [
// //                                   Image.asset(
// //                                     snapshot.data![index].image.toString(),
// //                                     width: 115,
// //                                     height: 115,
// //                                   ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.all(20),
// //                                     child: Column(
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                       children: [
// //                                         Text(snapshot.data![index].productName
// //                                             .toString()),
// //                                         Row(
// //                                           children: [
// //                                             Text(snapshot
// //                                                 .data![index].productPrice
// //                                                 .toString()),
// //                                             SizedBox(
// //                                               width: 10,
// //                                             ),
// //                                             Text(snapshot.data![index].unitTag
// //                                                 .toString())
// //                                           ],
// //                                         ),
// //                                         SizedBox(
// //                                           height: 40,
// //                                           width: 150,
// //                                           child: ElevatedButton(
// //                                             style: ElevatedButton.styleFrom(
// //                                               backgroundColor: Colors.green,
// //                                               shape: RoundedRectangleBorder(
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(10),
// //                                               ),
// //                                             ),
// //                                             onPressed: () {
// //                                               // dbhelper!
// //                                               //     .insert(Cart(
// //                                               //         id: index,
// //                                               //         productId: index.toString(),
// //                                               //         productName: productname[index]
// //                                               //             .toString(),
// //                                               //         initialPrice:
// //                                               //             productprice[index],
// //                                               //         productPrice:
// //                                               //             productprice[index],
// //                                               //         quantity: 1,
// //                                               //         unittag: productunit[index]
// //                                               //             .toString(),
// //                                               //         image: imagePaths[index]
// //                                               //             .toString()))
// //                                               //     .then((value) {
// //                                               //   print("Prdouct is Added to Cart :)");
// //                                               //   cart.addTotalPrice(double.parse(
// //                                               //       productprice[index].toString()));
// //                                               //   cart.addCounter();
// //                                               // }).onError((Error, StackTrace) {
// //                                               //   print(Error.toString());
// //                                               // });
// //                                             },
// //                                             child: Text(
// //                                               "Add To Cart",
// //                                               style: TextStyle(
// //                                                 color: Colors.white,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   );
// //                 } else {}
// //                 return Text('');
// //               }),
// //           Consumer<CartProvider>(builder: (context, value, child) {
// //             return Column(
// //               // ignore: prefer_const_literals_to_create_immutables
// //               children: [
// //                 ReuseableWidget(
// //                   title: "Sub Total ",
// //                   value: r'$' + value.getTotalPrice().toStringAsFixed(2),
// //                 )
// //               ],
// //             );
// //           })
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ReuseableWidget extends StatelessWidget {
// //   final String title, value;
// //   const ReuseableWidget({required this.title, required this.value});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4),
// //       child: Row(
// //         children: [
// //           Text(
// //             title,
// //             style: TextStyle(fontSize: 15),
// //           ),
// //           Text(
// //             value.toString(),
// //             style: TextStyle(fontSize: 15),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   DBHelper? dbHelper = DBHelper();

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//         centerTitle: true,
//         actions: [
//           Center(
//             child: badge.Badge(
//               showBadge: true,
//               badgeContent: Consumer<CartProvider>(
//                 builder: (context, value, child) {
//                   return Text(value.getCounter().toString(),
//                       style: TextStyle(color: Colors.white));
//                 },
//               ),
//               child: Icon(Icons.shopping_bag_outlined),
//             ),
//           ),
//           SizedBox(width: 20.0)
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future: cart.getData(),
//                 builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
//                   if (snapshot.hasData) {
//                     if (snapshot.data!.isEmpty) {
//                       return Align(
//                         alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Image(
//                               image: AssetImage('images/empty_cart.png'),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text('Your cart is empty 😌',
//                                 style: TextStyle(fontSize: 16)),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                                 'Explore products and shop your\nfavourite items',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 16))
//                           ],
//                         ),
//                       );
//                     } else {
//                       return Expanded(
//                         child: ListView.builder(
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (context, index) {
//                               return Card(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Image(
//                                             height: 100,
//                                             width: 100,
//                                             image: NetworkImage(snapshot
//                                                 .data![index].image
//                                                 .toString()),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       snapshot.data![index]
//                                                           .productName
//                                                           .toString(),
//                                                       style: TextStyle(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w500),
//                                                     ),
//                                                     InkWell(
//                                                         onTap: () {
//                                                           dbHelper!.delete(
//                                                               snapshot
//                                                                   .data![index]
//                                                                   .id!);
//                                                           cart.removerCounter();
//                                                           cart.removeTotalPrice(
//                                                               double.parse(snapshot
//                                                                   .data![index]
//                                                                   .productPrice
//                                                                   .toString()));
//                                                         },
//                                                         child:
//                                                             Icon(Icons.delete))
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                                 Text(
//                                                   snapshot.data![index].unitTag
//                                                           .toString() +
//                                                       " " +
//                                                       r"$" +
//                                                       snapshot.data![index]
//                                                           .productPrice
//                                                           .toString(),
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                                 Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: InkWell(
//                                                     onTap: () {},
//                                                     child: Container(
//                                                       height: 35,
//                                                       width: 100,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.green,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(5)),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(4.0),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             InkWell(
//                                                                 onTap: () {
//                                                                   int quantity = snapshot
//                                                                       .data![
//                                                                           index]
//                                                                       .quantity!;
//                                                                   int price = snapshot
//                                                                       .data![
//                                                                           index]
//                                                                       .initialPrice!;
//                                                                   quantity--;
//                                                                   int?
//                                                                       newPrice =
//                                                                       price *
//                                                                           quantity;

//                                                                   if (quantity >
//                                                                       0) {
//                                                                     dbHelper!
//                                                                         .updateQuantity(Cart(
//                                                                             id: snapshot.data![index].id!,
//                                                                             productId: snapshot.data![index].id!.toString(),
//                                                                             productName: snapshot.data![index].productName!,
//                                                                             initialPrice: snapshot.data![index].initialPrice!,
//                                                                             productPrice: newPrice,
//                                                                             quantity: quantity,
//                                                                             unitTag: snapshot.data![index].unitTag.toString(),
//                                                                             image: snapshot.data![index].image.toString()))
//                                                                         .then((value) {
//                                                                       newPrice =
//                                                                           0;
//                                                                       quantity =
//                                                                           0;
//                                                                       cart.removeTotalPrice(double.parse(snapshot
//                                                                           .data![
//                                                                               index]
//                                                                           .initialPrice!
//                                                                           .toString()));
//                                                                     }).onError((error, stackTrace) {
//                                                                       print(error
//                                                                           .toString());
//                                                                     });
//                                                                   }
//                                                                 },
//                                                                 child: Icon(
//                                                                   Icons.remove,
//                                                                   color: Colors
//                                                                       .white,
//                                                                 )),
//                                                             Text(
//                                                                 snapshot
//                                                                     .data![
//                                                                         index]
//                                                                     .quantity
//                                                                     .toString(),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white)),
//                                                             InkWell(
//                                                                 onTap: () {
//                                                                   int quantity = snapshot
//                                                                       .data![
//                                                                           index]
//                                                                       .quantity!;
//                                                                   int price = snapshot
//                                                                       .data![
//                                                                           index]
//                                                                       .initialPrice!;
//                                                                   quantity++;
//                                                                   int?
//                                                                       newPrice =
//                                                                       price *
//                                                                           quantity;

//                                                                   dbHelper!
//                                                                       .updateQuantity(Cart(
//                                                                           id: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .id!,
//                                                                           productId: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .id!
//                                                                               .toString(),
//                                                                           productName: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .productName!,
//                                                                           initialPrice: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .initialPrice!,
//                                                                           productPrice:
//                                                                               newPrice,
//                                                                           quantity:
//                                                                               quantity,
//                                                                           unitTag: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .unitTag
//                                                                               .toString(),
//                                                                           image: snapshot
//                                                                               .data![
//                                                                                   index]
//                                                                               .image
//                                                                               .toString()))
//                                                                       .then(
//                                                                           (value) {
//                                                                     newPrice =
//                                                                         0;
//                                                                     quantity =
//                                                                         0;
//                                                                     cart.addTotalPrice(double.parse(snapshot
//                                                                         .data![
//                                                                             index]
//                                                                         .initialPrice!
//                                                                         .toString()));
//                                                                   }).onError((error,
//                                                                           stackTrace) {
//                                                                     print(error
//                                                                         .toString());
//                                                                   });
//                                                                 },
//                                                                 child: Icon(
//                                                                   Icons.add,
//                                                                   color: Colors
//                                                                       .white,
//                                                                 )),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),
//                       );
//                     }
//                   }
//                   return Text('');
//                 }),
//             Consumer<CartProvider>(builder: (context, value, child) {
//               return Visibility(
//                 visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
//                     ? false
//                     : true,
//                 child: Column(
//                   children: [
//                     ReusableWidget(
//                       title: 'Sub Total',
//                       value: r'$' + value.getTotalPrice().toStringAsFixed(2),
//                     ),
//                     ReusableWidget(
//                       title: 'Discout 5%',
//                       value: r'$' + '20',
//                     ),
//                     ReusableWidget(
//                       title: 'Total',
//                       value: r'$' + value.getTotalPrice().toStringAsFixed(2),
//                     )
//                   ],
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ReusableWidget extends StatelessWidget {
//   final String title, value;
//   const ReusableWidget({required this.title, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: TextStyle(fontSize: 16)),
//           Text(value.toString(), style: TextStyle(fontSize: 16))
//         ],
//       ),
//     );
//   }
// }

import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

import 'cartmodel.dart';
import 'db.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          Center(
            child: badge.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Text(value.getCounter().toString(),
                      style: TextStyle(color: Colors.white));
                },
              ),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder(
                future: cart.getData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/images/empty_cart.png'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Your cart is empty 😌',
                                style: TextStyle(fontSize: 15)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Explore products and shop your\nfavourite items',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            snapshot.data![index].image
                                                .toString(),
                                            width: 90,
                                            height: 90,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      snapshot.data![index]
                                                          .productName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          dbHelper!.delete(
                                                              snapshot
                                                                  .data![index]
                                                                  .id!);
                                                          cart.removerCounter();
                                                          cart.removeTotalPrice(
                                                              double.parse(snapshot
                                                                  .data![index]
                                                                  .productPrice
                                                                  .toString()));
                                                        },
                                                        child:
                                                            Icon(Icons.delete))
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  snapshot.data![index].unitTag
                                                          .toString() +
                                                      " " +
                                                      r"$" +
                                                      snapshot.data![index]
                                                          .productPrice
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  int quantity = snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity!;
                                                                  int price = snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialPrice!;
                                                                  quantity--;
                                                                  int?
                                                                      newPrice =
                                                                      price *
                                                                          quantity;

                                                                  if (quantity >
                                                                      0) {
                                                                    dbHelper!
                                                                        .updateQuantity(Cart(
                                                                            id: snapshot.data![index].id!,
                                                                            productId: snapshot.data![index].id!.toString(),
                                                                            productName: snapshot.data![index].productName!,
                                                                            initialPrice: snapshot.data![index].initialPrice!,
                                                                            productPrice: newPrice,
                                                                            quantity: quantity,
                                                                            unitTag: snapshot.data![index].unitTag.toString(),
                                                                            image: snapshot.data![index].image.toString()))
                                                                        .then((value) {
                                                                      newPrice =
                                                                          0;
                                                                      quantity =
                                                                          0;
                                                                      cart.removeTotalPrice(double.parse(snapshot
                                                                          .data![
                                                                              index]
                                                                          .initialPrice!
                                                                          .toString()));
                                                                    }).onError((error, stackTrace) {
                                                                      print(error
                                                                          .toString());
                                                                    });
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            Text(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                            InkWell(
                                                                onTap: () {
                                                                  int quantity = snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity!;
                                                                  int price = snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialPrice!;
                                                                  quantity++;
                                                                  int?
                                                                      newPrice =
                                                                      price *
                                                                          quantity;

                                                                  dbHelper!
                                                                      .updateQuantity(Cart(
                                                                          id: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .id!,
                                                                          productId: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .id!
                                                                              .toString(),
                                                                          productName: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .productName!,
                                                                          initialPrice: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .initialPrice!,
                                                                          productPrice:
                                                                              newPrice,
                                                                          quantity:
                                                                              quantity,
                                                                          unitTag: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .unitTag
                                                                              .toString(),
                                                                          image: snapshot
                                                                              .data![
                                                                                  index]
                                                                              .image
                                                                              .toString()))
                                                                      .then(
                                                                          (value) {
                                                                    newPrice =
                                                                        0;
                                                                    quantity =
                                                                        0;
                                                                    cart.addTotalPrice(double.parse(snapshot
                                                                        .data![
                                                                            index]
                                                                        .initialPrice!
                                                                        .toString()));
                                                                  }).onError((error,
                                                                          stackTrace) {
                                                                    print(error
                                                                        .toString());
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                      );
                    }
                  }
                  return Text('');
                }),
            Consumer<CartProvider>(builder: (context, value, child) {
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                    ? false
                    : true,
                child: Column(
                  children: [
                    ReusableWidget(
                      title: 'Sub Total',
                      value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                    ),
                    ReusableWidget(
                      title: 'Discout 5%',
                      value: r'$' + '20',
                    ),
                    ReusableWidget(
                      title: 'Total',
                      value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 15)),
          Text(value.toString(), style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
