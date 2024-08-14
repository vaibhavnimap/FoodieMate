import 'package:flutter/material.dart';
import 'package:foodiemate/data/controllers/auth_controller.dart';
import 'package:foodiemate/widgets/custom_button/custom_button.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final AuthController _controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodieMate"),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/foodiemate.png'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Receive an email to \nreset your password.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _controller.forgotPasswordemailcontroller,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                // prefixIcon: Icon(
                //   Icons.search,
                //   size: 30,
                // ),
                focusedBorder: const OutlineInputBorder(
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
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // TextField(
            //   controller: _controller.passwordController,
            //   decoration: InputDecoration(
            //     fillColor: Colors.grey[300],
            //     filled: true,
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //           width: 2,
            //           style: BorderStyle.solid,
            //           color: Colors.orangeAccent),
            //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //     ),
            //
            //     // prefixIcon: Icon(
            //     //   Icons.search,
            //     //   size: 30,
            //     // ),
            //
            //     hintText: 'Password...',
            //     // enabledBorder: ,
            //     // contentPadding:
            //     //     const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         width: 0,
            //         style: BorderStyle.none,
            //       ),
            //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(
            //       "Forgot Password ?",
            //       style: TextStyle(
            //           color: Colors.orange, fontWeight: FontWeight.w500),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: Button(
                text: "Reset Password",
                onTap: () {
                  _controller.forgotpasswordValidate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
