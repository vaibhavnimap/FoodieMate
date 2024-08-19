import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final RxString? imageUrl = "".obs;

     final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    User? user =  FirebaseAuth.instance.currentUser;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    loadImageUrl();
    super.onInit();
  }

  Future<void> loadImageUrl() async {
    final doc = await FirebaseFirestore.instance
        .collection('image')
        .doc(user?.uid)
        .get();

    imageUrl?.value = doc['profileImageUrl'];
  }


  Future<void> pickAndUploadImage(ImageSource source) async {
    final imageFile = await (source == ImageSource.camera
        ? pickImageFromCamera()
        : pickImage());

    if (imageFile != null) {
      final imageurl = await uploadImage(imageFile);

      if (imageurl != null) {
        
          imageUrl?.value = imageurl;
        

        // Optionally, save the image URL to Firestore
        await FirebaseFirestore.instance.collection('image').doc(user!.uid).update({
          'profileImageUrl': imageurl,
        });
      }
    }
  }



  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = _firebaseStorage.ref().child('uploads/$fileName');
      final uploadTask = ref.putFile(imageFile);

      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
