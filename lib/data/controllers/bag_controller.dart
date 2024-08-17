import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BagController extends GetxController {
  var products = <Map<String, dynamic>>[].obs;
  RxDouble subTotal = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserBag();
  }

  void deleteProduct(String productId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference productRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .doc(productId);

      await productRef.delete().catchError((error) {
        print("Failed to update product: $error");
      });
    }
    fetchUserBag();
    subTotalFunc();
  }

  void fetchUserBag() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .snapshots()
          .listen((snapshot) {
        products.value = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Save the document ID for later use
          return data;
        }).toList();
        subTotalFunc();
      });
    }
  }

  Future<void> updateProductQuantity(String productId, int newQuantity) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentReference productRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .doc(productId);

      var productDoc = await productRef.get();
      var productData = productDoc.data() as Map<String, dynamic>;

      double initialPrice = productData['initialprice'];
      double newPrice = initialPrice * newQuantity;

      await productRef.update({
        'quantity': newQuantity,
        'price': newPrice,
      }).catchError((error) {
        print("Failed to update product: $error");
      });
    }
    fetchUserBag();
    subTotalFunc();
  }

  void addProductToUserBag(String productName, String size, int quantity,
      String photoUrl, double price, double initialPrice) async {
    User? user = FirebaseAuth.instance.currentUser;
    print(user);

    if (user != null) {
      print("h1");
      CollectionReference userBagCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('bag');
      print("h1");
      print(userBagCollection);

      await userBagCollection.add({
        'product_name': productName,
        'size': size,
        'quantity': quantity,
        'photo_url': photoUrl,
        'price': price,
        'initialprice': initialPrice,
      }).then((value) {
        print("Product Added to User's Bag with ID: ${value.id}");
      }).catchError((error) {
        print("Failed to add product: $error");
      });
    } else {
      print("No user logged in.");
    }
    subTotalFunc();
  }

  // double get totalPrice {
  //   return products.fold(
  //       0.0, (sum, product) => sum + (product['price'] as double));
  // }
  Future<void> subTotalFunc() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .collection('bag')
          .get();

      double total = snapshot.docs.fold(0.0, (sum, doc) {
        var data = doc.data();
        return sum + (data['price'] as double);
      });

      subTotal.value = total;
    }
  }
}
