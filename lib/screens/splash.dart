import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
import 'package:foodiemate/i18n/strings.g.dart';
import 'package:foodiemate/screens/authscreens/loginscreen.dart';
import 'package:foodiemate/screens/home_screen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final RestaurantController _restaurantController =
  //     Get.put(RestaurantController(), permanent: true);

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    // _restaurantController.fetchRestaurants();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Future.delayed(
      Duration(seconds: 3),
      () {
        try {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              Get.offAll(() => Loginscreen());
            } else {
              Get.offAll(() => HomeScreen());
            }
          });
        } catch (e) {
          Get.offAll(() => Loginscreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/splashimage.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              t.food_to_blow_your_mind,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Text(
              "Whether you're craving pizza, sushi, or ",
              style: TextStyle(color: ConstantColors.greyblack, fontSize: 18),
            ),
            Text(
              "something in between, we have got your back.",
              style: TextStyle(color: ConstantColors.greyblack, fontSize: 18),
            ),
            Spacer(),
            Button(
              text: "Get Started",
              onTap: () {
                try {
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null) {
                      Get.offAll(() => Loginscreen());
                    } else {
                      Get.offAll(() => HomeScreen());
                    }
                  });
                } catch (e) {
                  Get.offAll(() => Loginscreen());
                }
              },
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
