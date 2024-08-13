import 'package:flutter/material.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Deliver to:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/mapimage.png")),
                SizedBox(
                  width: 15,
                ),
                Column(
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
            SizedBox(
              height: 10,
            ),
            Row(
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
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Bank Card"), Icon(Icons.keyboard_arrow_down)],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/debitcard.png'),
            SizedBox(
              height: 10,
            ),
            Row(
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
            Expanded(
              child: SizedBox(),
            ),
            Button(
              onTap: () {
                Get.to(CheckoutScreen());
              },
              text: "Comfirm Order",
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
