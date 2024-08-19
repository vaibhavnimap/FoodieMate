import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/bag_controller.dart';
import 'package:foodiemate/screens/bagscreens/checkout_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final BagController bagController = Get.put(BagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Bag",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(
          () => Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text("The Pizza Palace"),
              //   ],
              // ),
              Expanded(
                child: Obx(() {
                  if (bagController.products.isEmpty) {
                    return Center(child: Text('No products found.'));
                  } else {
                    return ListView.builder(
                      itemCount: bagController.products.length,
                      itemBuilder: (context, index) {
                        var product = bagController.products[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: product['photo_url'] != null
                                  ? Image.network(
                                      product['photo_url'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.image),
                              title: Text(
                                product['product_name'],
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                              subtitle: Text(
                                "Size: ${product['size']} \n\$${product['price'].toStringAsFixed(2)}",
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                              trailing: Container(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.cancel,
                                        size: 15,
                                      ),
                                      onTap: () {
                                        bagController
                                            .deleteProduct(product['id']);
                                      },
                                    ),
                                    SizedBox(
                                      height: 21,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (product['quantity'] > 1) {
                                              bagController
                                                  .updateProductQuantity(
                                                      product['id'],
                                                      product['quantity'] - 1);
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                )),
                                            height: 20,
                                            child: const Center(
                                                child: Icon(
                                              Icons.remove,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(product['quantity'].toString()),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            bagController.updateProductQuantity(
                                                product['id'],
                                                product['quantity'] + 1);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                )),
                                            height: 20,
                                            child: const Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                            ),
                            Divider(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),

                //   ListView.builder(
                //   itemCount: products.length,
                //   itemBuilder: (context, index) {
                //     var product = products[index];
                //     return ListTile(
                //       leading: product['photo_url'] != null
                //           ? Image.network(product['photo_url'],
                //               width: 50, height: 50, fit: BoxFit.cover)
                //           : Icon(Icons.image),
                //       title: Text(product['product_name'] ?? 'No Name'),
                //       subtitle: Text(
                //           'Size: ${product['size'] ?? 'Unknown'}\nQuantity: ${product['quantity'] ?? 0}\nPrice: ${product['price'] ?? 0.0}'),
                //     );
                //   },
                // );
                //     }
                //   },
                // ),
                // ListView.builder(
                //     itemCount: 5,
                //     itemBuilder: (context, index) {
                //       return Column(
                //         children: [
                //           ListTile(
                //             leading: Container(
                //               child: Image.asset(
                //                 'assets/images/pizza.png',
                //               ),
                //             ),
                //
                //             title: Text(
                //               "Kings Deal",
                //               style: TextStyle(overflow: TextOverflow.ellipsis),
                //             ),
                //
                //             subtitle: Text(
                //               "BBQ BEEF \n\$${20.80}",
                //               style: TextStyle(overflow: TextOverflow.ellipsis),
                //             ),
                //
                //             // subtitle: Container(
                //             //   width: 200,
                //             //   child: Column(
                //             //     crossAxisAlignment: CrossAxisAlignment.center,
                //             //     children: [Text("BBQ BEEF"), Text("\$${20.34}")],
                //             //   ),
                //             // ),
                //             trailing: Container(
                //               width: 100,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.end,
                //                 children: [
                //                   Icon(
                //                     Icons.cancel,
                //                     size: 15,
                //                   ),
                //                   SizedBox(
                //                     height: 21,
                //                   ),
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       Container(
                //                         padding: const EdgeInsets.symmetric(
                //                             horizontal: 2),
                //                         decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             border: Border.all(
                //                               color: Colors.grey,
                //                               width: 1,
                //                             )),
                //                         height: 20,
                //                         child: const Center(
                //                             child: Icon(
                //                           Icons.remove,
                //                           size: 15,
                //                         )),
                //                       ),
                //                       const SizedBox(
                //                         width: 10,
                //                       ),
                //                       const Text("1"),
                //                       const SizedBox(
                //                         width: 10,
                //                       ),
                //                       Container(
                //                         padding: const EdgeInsets.symmetric(
                //                             horizontal: 3),
                //                         decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             border: Border.all(
                //                               color: Colors.grey,
                //                               width: 1,
                //                             )),
                //                         height: 20,
                //                         child: const Center(
                //                             child: Icon(
                //                           Icons.add,
                //                           size: 15,
                //                         )),
                //                       ),
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             ),
                //             isThreeLine: true,
                //           ),
                //           Divider(
                //             height: 2,
                //             color: Colors.grey,
                //           )
                //         ],
                //       );
                //     }),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    filled: true,

                    suffixIcon: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Icon(
                        Icons.send,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),

                    hintText: 'Enter Promo Code',
                    // enabledBorder: ,
                    // contentPadding:
                    //     const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal"),
                        Text(
                            "\$${bagController.subTotal.value.toStringAsFixed(2)}")
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery"), Text("\$${29.00}")],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "\$${(bagController.subTotal.value + 29.00).toStringAsFixed(2)}",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Button(
                onTap: () {
                  Get.to(CheckoutScreen());
                },
                text: "Checkout",
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
