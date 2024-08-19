import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/bag_controller.dart';
import 'package:foodiemate/data/controllers/bottom_navigationbar.dart';
import 'package:foodiemate/screens/home_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final BagController bagController = Get.find<BagController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 50,
              // width: 50,
              decoration: BoxDecoration(
                // color: Colors.grey[100],
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ]),
        ),
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "Deliver to:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/mapimage.png")),
                const SizedBox(
                  width: 15,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amelia Cassin",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "102 st ports, NEW YORK",
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Text("458-419-7182"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment method",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Add payment method",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Bank Card"), Icon(Icons.keyboard_arrow_down)],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/debitcard.png'),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total to pay",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("\$${83.66}",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Button(
              onTap: () {
                final controller = Get.find<BottomNavigationbarController>();

                controller.onItemTapped(2);
                bagController.placeOrder();
                Get.offAll(() => HomeScreen());
              },
              text: "Comfirm Order",
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
