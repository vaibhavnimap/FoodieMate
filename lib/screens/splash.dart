import 'package:flutter/material.dart';
import 'package:foodiemate/data/utils/constantcolors.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Future.delayed(
      Duration(seconds: 10),
      () {
        Get.offAll(() => Loginscreen());
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
              "Food to blow your mind!",
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
                Get.offAll(() => HomeScreen());
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
