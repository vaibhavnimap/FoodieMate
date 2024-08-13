import 'package:flutter/material.dart';
import 'package:foodiemate/screens/bagscreens/checkout_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("The Pizza Palace"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            child: Image.asset(
                              'assets/images/pizza.png',
                            ),
                          ),

                          title: Text(
                            "Kings Deal",
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),

                          subtitle: Text(
                            "BBQ BEEF \n\$${20.80}",
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),

                          // subtitle: Container(
                          //   width: 200,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [Text("BBQ BEEF"), Text("\$${20.34}")],
                          //   ),
                          // ),
                          trailing: Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.cancel,
                                  size: 15,
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("1"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
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
                                  ],
                                )
                              ],
                            ),
                          ),
                          isThreeLine: true,
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,

                suffixIcon: Container(
                  width: 150,
                  height: 60,
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Subtotal"), Text("\$${17.66}")],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Delivery"), Text("\$${12.00}")],
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
                Text("\$${83.66}",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
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
    );
  }
}
