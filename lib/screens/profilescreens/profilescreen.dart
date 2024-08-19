import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/auth_controller.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
import 'package:foodiemate/screens/changelanguague/change_language_screen.dart';
import 'package:get/get.dart';

class Profilescreen extends StatelessWidget {
  Profilescreen({super.key});

  final AuthController _controller = Get.put(AuthController(), permanent: true);
  final _instance = FirebaseAuth.instance;

  void updateAddress(BuildContext ctx) {
    final controller = Get.find<AuthController>();
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 11,
            ),
            Center(
              child: SizedBox(
                height: 5,
                width: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: controller.addressController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller
                          .updateAddress(controller.addressController.text);
                      Get.back();
                    },
                    child: Text("Save Address"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        child: Obx(
          () => Column(
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
                  Text(
                    _instance.currentUser?.displayName ?? "Amelia Cassin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _controller.address.value,
                        // "102 st ports, NEW YORK",
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
                      InkWell(
                        onTap: () {
                          updateAddress(context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Delivery Address",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: ConstantColors.greyblack),
                            ),
                            Text(_controller.address.value,
                                style: const TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.w300,
                                    color: ConstantColors.greyblack))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ChangeLanguageScreen());
                    },
                    child: Row(
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
                            Text("Change Language",
                                style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.w300,
                                    color: ConstantColors.greyblack))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
