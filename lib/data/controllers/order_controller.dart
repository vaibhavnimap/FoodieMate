import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  void fetchUserOrders() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('order')
          .snapshots()
          .listen((snapshot) {
        orders.value = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Save the document ID for later use
          return data;
        }).toList();
      });
    }
  }

  // void addOrderToUserOrders(String productName, String size, int quantity,
  //     String photoUrl, double price, double initialPrice) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   print(user);
  //
  //   if (user != null) {
  //     print("h1");
  //     CollectionReference userOrderCollection = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .collection('order');
  //
  //     await userOrderCollection.add({
  //       'product_name': productName,
  //       'size': size,
  //       'quantity': quantity,
  //       'photo_url': photoUrl,
  //       'price': price,
  //       'initialprice': initialPrice,
  //     }).then((value) {
  //       print("Order Added to User's OrdrerList with ID: ${value.id}");
  //     }).catchError((error) {
  //       print("Failed to add Order: $error");
  //     });
  //   } else {
  //     print("No user logged in.");
  //   }
  // }
}
