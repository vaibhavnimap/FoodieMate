import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodiemate/screens/authscreens/loginscreen.dart';
import 'package:foodiemate/screens/home_screen.dart';
import 'package:foodiemate/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPasswordemailcontroller = TextEditingController();
  final _instance = FirebaseAuth.instance;

  void register() async {
    String message = "";
    try {
      await _instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      CustomSnackBar.success("user created sucessfully");
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else if (e.code == 'network-request-failed') {
        message = 'Check your internet connection';
      }
      CustomSnackBar.error(message);
    } catch (e) {
      CustomSnackBar.error("Failed $e");
    }
  }

  void registerValidate() {
    if (emailController.text.trim().isEmpty) {
      CustomSnackBar.error("Email ID is required");
      return;
    } else if (!emailController.text.trim().isEmail) {
      CustomSnackBar.error("Invalid email id");
      return;
    } else if (passwordController.text.trim().isEmpty) {
      CustomSnackBar.error("Password is required");
      return;
    } else if (passwordController.text.trim().length < 6) {
      CustomSnackBar.error("Password must be greater than 6");
      return;
    } else {
      register();
    }
  }

  void login() async {
    String message = "";
    try {
      await _instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      CustomSnackBar.success("login sucessfully");
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        message = 'Invalid Credentials';
      } else if (e.code == 'user-not-found') {
        message = 'no user with corresponding email';
      } else if (e.code == 'wrong-password') {
        message = 'incorrect password';
      } else if (e.code == 'network-request-failed') {
        message = 'Check your internet connection';
      }
      CustomSnackBar.error(message);
    } catch (e) {
      CustomSnackBar.error("Failed $e");
    }
  }

  void loginValidate() {
    if (emailController.text.trim().isEmpty) {
      CustomSnackBar.error("Email ID is required");
      return;
    } else if (!emailController.text.trim().isEmail) {
      CustomSnackBar.error("Invalid email id");
      return;
    } else if (passwordController.text.trim().isEmpty) {
      CustomSnackBar.error("Password is required");
      return;
    } else if (passwordController.text.trim().length < 6) {
      CustomSnackBar.error("Password must be greater than 6");
      return;
    } else {
      login();
    }
  }

  void forgotpassword() async {
    String message = "";
    try {
      await _instance.sendPasswordResetEmail(
        email: forgotPasswordemailcontroller.text,
      );
      CustomSnackBar.success("Email send sucessfully.");
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(Loginscreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        message = 'email id is invalid.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found with corresponding email id.';
      }
      CustomSnackBar.error(message);
    } catch (e) {
      CustomSnackBar.error("Failed $e");
    }
  }

  void forgotpasswordValidate() {
    if (forgotPasswordemailcontroller.text.trim().isEmpty) {
      CustomSnackBar.error("Email ID is required");
      return;
    } else if (!forgotPasswordemailcontroller.text.trim().isEmail) {
      CustomSnackBar.error("Invalid email id");
      return;
    } else {
      forgotpassword();
    }
  }
}
