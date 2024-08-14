import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/auth_controller.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
import 'package:get/get.dart';

class Profilescreen extends StatelessWidget {
  Profilescreen({super.key});

  final AuthController _controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.emailController.clear();
          _controller.passwordController.clear();
          FirebaseAuth.instance.signOut();
        },
        child: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50, // Adjust the radius for the size you want
                  backgroundImage: const NetworkImage(
                    "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
                  ),
                  backgroundColor: Colors.grey.shade200, // A default colo
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Amelia Cassin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "102 st ports, NEW YORK",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: ConstantColors.greyblack),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                const Text(
                  "458-419-7182",
                  style: TextStyle(color: ConstantColors.greyblack),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      // width: 50,
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        color: ConstantColors.greyblack.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.payment),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment methods",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ConstantColors.greyblack),
                        ),
                        Text("Two Cards Added",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.w300,
                                color: ConstantColors.greyblack))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      // width: 50,
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        color: ConstantColors.greyblack.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.home),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Address",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ConstantColors.greyblack),
                        ),
                        Text("102nd St Ports, New York",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.w300,
                                color: ConstantColors.greyblack))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      // width: 50,
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        color: ConstantColors.greyblack.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.settings),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ConstantColors.greyblack),
                        ),
                        Text("Notification | FAQ | Contact",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.w300,
                                color: ConstantColors.greyblack))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
