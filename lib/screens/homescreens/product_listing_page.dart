import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:foodiemate/screens/homescreens/product_detail_page.dart';
import 'package:get/get.dart';

class ProductListingPage extends StatefulWidget {
  ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    // _controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
              ),
              Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      // color: Colors.grey[100],
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "The Pizza Place ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "20-30 mins delivery",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingStars(
                          axis: Axis.horizontal,
                          value: 3,
                          onValueChanged: (v) {
                            //
                            // setState(() {
                            //   value = v;
                            // });
                          },
                          starCount: 5,
                          starSize: 20,
                          valueLabelColor: const Color(0xff9b9b9b),
                          valueLabelTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          valueLabelRadius: 10,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: true,
                          animationDuration: Duration(milliseconds: 1000),
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            Text(
                              "2km away",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            )
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),
          TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              controller: _controller,
              tabs: [
                Tab(
                  text: 'Combo Deals',
                ),
                Tab(
                  text: 'Classic Pizza',
                ),
                Tab(
                  text: 'Premium Pizza',
                ),
                Tab(
                  text: 'Sides',
                ),
                Tab(
                  text: 'Drinks',
                )
              ]),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, builder) {
                        return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/pizza.png'),
                          ),
                          title: Text("Kings Deal"),
                          subtitle: Text(
                            "Any medium classic pizza + a chsdhgvodasugocuagodsugoausguocolate pizza + a pet drink",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text("\$${20.34}"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ]),
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, builder) {
                        return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/pizza.png'),
                          ),
                          title: Text("Kings Deal"),
                          subtitle: Text(
                            "Any medium classic pizza + a chsdhgvodasugocuagodsugoausguocolate pizza + a pet drink",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text("\$${20.34}"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ]),
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, builder) {
                        return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/pizza.png'),
                          ),
                          title: Text("Kings Deal"),
                          subtitle: Text(
                            "Any medium classic pizza + a chsdhgvodasugocuagodsugoausguocolate pizza + a pet drink",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text("\$${20.34}"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ]),
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, builder) {
                        return ListTile(
                          onTap: () {
                            Get.to(ProductDetailPage());
                          },
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/pizza.png'),
                          ),
                          title: Text("Kings Deal"),
                          subtitle: Text(
                            "Any medium classic pizza + a chsdhgvodasugocuagodsugoausguocolate pizza + a pet drink",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text("\$${20.34}"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ]),
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, builder) {
                        return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/pizza.png'),
                          ),
                          title: Text("Kings Deal"),
                          subtitle: Text(
                            "Any medium classic pizza + a chsdhgvodasugocuagodsugoausguocolate pizza + a pet drink",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text("\$${20.34}"),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
