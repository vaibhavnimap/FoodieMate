import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:foodiemate/data/controllers/themecontroller.dart';
import 'package:foodiemate/data/utils/customtheme.dart';
import 'package:foodiemate/screens/homescreens/product_listing_page.dart';
import 'package:foodiemate/widgets/mycustomclipper.dart';
import 'package:get/get.dart';

class HomeScreenUi extends StatefulWidget {
  HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  final ThemeController _controller =
      Get.put(ThemeController(), permanent: true);

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deliver to:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("08776 Serenity Ports, New York ")
                  ],
                ),
                Icon(Icons.person),
                Obx(
                  () => Switch(
                    value: _controller.currentTheme.value == ThemeMode.dark,
                    onChanged: (value) {
                      _controller.switchTheme();
                      Get.changeThemeMode(_controller.currentTheme.value);
                    },
                    activeColor: CustomTheme.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //   ),
            //   child:
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),

                hintText: 'Search Near By Restaurants Names',
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
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Restaurants",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, builder) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProductListingPage());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(30),
                            //   // clipper: ,
                            //   child: Image.network(
                            //     "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
                            //   ),
                            // ),
                            Stack(children: [
                              ClipPath(
                                clipper: MyCustomClipper(),
                                child: Image.network(
                                  "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      ))),
                            ]),

                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "The Pizza Palace",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    animationDuration:
                                        Duration(milliseconds: 1000),
                                    valueLabelPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 8),
                                    valueLabelMargin:
                                        const EdgeInsets.only(right: 8),
                                    starOffColor: const Color(0xffe7e8ea),
                                    starColor: Colors.yellow,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "2km away",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      )
                                    ],
                                  )
                                ]),
                          ],
                        ),
                      ),
                    );
                  }),
            )
            // )
          ],
        ),
      ),
    );
  }
}
