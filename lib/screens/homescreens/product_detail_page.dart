import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/bag_controller.dart';
import 'package:foodiemate/data/controllers/product_conrtoller.dart';
import 'package:foodiemate/data/models/restaurant.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
import 'package:foodiemate/screens/home_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    _productController.initialProductPrice.value = widget.product.price;
    _productController.productPrice.value = widget.product.price;
    super.initState();
  }

  final ProductController _productController =
      Get.put(ProductController(), permanent: true);
  final BagController _bagController =
      Get.put(BagController(), permanent: true);

  List<String> drinkLists = [
    "Coke",
    "Sprite",
    "Fanta",
    "Pepsi",
    "Beer",
    "Lemonade",
    "Water"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
            _productController.petDrink.value = '';
            _productController.productSize.value = '';
            _productController.productPrice.value =
                _productController.initialProductPrice.value;
            _productController.productQuantity.value = 1;
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
        title: Text(widget.product.productName),
        centerTitle: true,
        actions: [
          Text(
            "\$${widget.product.price}",
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
                    Image.network(
                      widget.product.productImage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _productController.productSize.value ==
                                          'X-Large'
                                      ? Colors.grey
                                      : Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                              height: 30,
                              child: const Center(child: Text("X-Large")),
                            ),
                            onTap: () {
                              _productController.changeSize("X-Large");
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _productController.changeSize("Large");
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: _productController.productSize.value ==
                                          'Large'
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                              height: 30,
                              child: const Center(child: Text("Large")),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _productController.changeSize("Small");
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: _productController.productSize.value ==
                                          'Small'
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                              height: 30,
                              child: const Center(child: Text("Small")),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
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
                        Obx(
                          () => Text(
                            "\$${_productController.productPrice.value.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: ConstantColors.yellowOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => Row(
                            children: [
                              InkWell(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: _productController
                                                    .productQuantity.value ==
                                                1
                                            ? Colors.grey.withOpacity(0.3)
                                            : Colors.grey.withOpacity(0.9),
                                        width: 1,
                                      )),
                                  height: 35,
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    color: _productController
                                                .productQuantity.value ==
                                            1
                                        ? Colors.grey[400]
                                        : Colors.grey[900],
                                  )),
                                ),
                                onTap: () {
                                  _productController.decreaseQuantity();
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(_productController.productQuantity
                                  .toString()),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  _productController.increaseQuantity();
                                },
                                child: Container(
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(widget.product.productDescription),
                    const SizedBox(
                      height: 25,
                    ),
                    // const Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [Text("Select Variant")]),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Wrap(
                    //   spacing: 5, // Space between each child
                    //   runSpacing: 5,
                    //   crossAxisAlignment: WrapCrossAlignment.start,
                    //   children: List.generate(lists.length, (index) {
                    //     return Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 10, vertical: 5),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(
                    //           color: Colors.grey,
                    //           width: 1,
                    //         ),
                    //       ),
                    //       child: Text(lists[index]),
                    //     );
                    //   }),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text("Select Pet Drink")]),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => Wrap(
                        spacing: 5, // Space between each child
                        runSpacing: 5,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: List.generate(drinkLists.length, (index) {
                          return InkWell(
                            onTap: () {
                              _productController.changeDrink(drinkLists[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: drinkLists[index] ==
                                        _productController.petDrink.value
                                    ? Colors.grey
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Text(drinkLists[index]),
                            ),
                          );
                        }),
                      ),
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
                _bagController.addProductToUserBag(
                  widget.product.productName,
                  _productController.productSize.value,
                  _productController.productQuantity.value,
                  widget.product.productImage,
                  _productController.productPrice.value,
                  _productController.initialProductPrice.value,
                );
                Get.offAll(() => const HomeScreen());
                _productController.petDrink.value = '';
                _productController.productSize.value = '';
                _productController.productPrice.value =
                    _productController.initialProductPrice.value;
                _productController.productQuantity.value = 1;
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
