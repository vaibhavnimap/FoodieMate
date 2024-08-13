import 'package:flutter/material.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
import 'package:foodiemate/screens/home_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  List<String> lists = [
    "sharma",
    "vaibhav",
    "mayur",
    "anhishek",
    "vikrant",
    "sharma",
    "vaibhav",
    "mayur",
    "anhishek",
    "vikrant"
  ];

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
        title: const Text("Kings Deal"),
        centerTitle: true,
        actions: [
          const Text(
            "\$${20.80}",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/pizza.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            height: 30,
                            child: const Center(child: Text("X-Large")),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              )),
                          height: 30,
                          child: const Center(child: Text("X-Large")),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              )),
                          height: 30,
                          child: const Center(child: Text("X-Large")),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 10,
                        // ),
                        const Text(
                          "\$${20.80}",
                          style: TextStyle(
                              color: ConstantColors.yellowOrange,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                              height: 35,
                              child: const Center(child: Icon(Icons.remove)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text("1"),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                              height: 35,
                              child: const Center(child: Icon(Icons.add)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                        "Any medium classic pizza + a chocolate pizza + a pet drink"),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Select Variant")]),
                    const SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      spacing: 5, // Space between each child
                      runSpacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(lists.length, (index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Text(lists[index]),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Select Pet Drink")]),
                    const SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      spacing: 5, // Space between each child
                      runSpacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(lists.length, (index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Text(lists[index]),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
              text: "Add to bag",
              onTap: () {
                Get.offAll(() => const HomeScreen());
              },
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
