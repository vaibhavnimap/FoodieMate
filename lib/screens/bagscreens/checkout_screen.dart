import 'package:flutter/material.dart';
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
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                // border:
              ),
              child: Row(
                children: [Text("Bank Card"), Icon(Icons.keyboard_arrow_down)],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,

                suffixIcon: Icon(
                  Icons.send,
                  size: 30,
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
          ],
        ),
      ),
    );
  }
}
