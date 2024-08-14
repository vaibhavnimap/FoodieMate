import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/auth_controller.dart';
import 'package:foodiemate/screens/authscreens/forgot_password_screen.dart';
import 'package:foodiemate/screens/authscreens/signupscreen.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final AuthController _controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/foodiemate.png'),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller.emailController,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                // prefixIcon: Icon(
                //   Icons.search,
                //   size: 30,
                // ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.orangeAccent),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),

                hintText: 'Email Address...',
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
              height: 15,
            ),
            TextField(
              controller: _controller.passwordController,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.orangeAccent),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),

                // prefixIcon: Icon(
                //   Icons.search,
                //   size: 30,
                // ),

                hintText: 'Password...',
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ForgotPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: Button(
                text: "Login",
                onTap: () {
                  _controller.loginValidate();
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    _controller.emailController.clear();
                    _controller.passwordController.clear();
                    Get.offAll(Signupscreen());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
