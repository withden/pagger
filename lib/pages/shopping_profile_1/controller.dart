// Base
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Need to add: image_picker library
// Run `flutter pub get image_picker`
import 'package:image_picker/image_picker.dart';

class ShoppingProfileController extends GetxController {
  File? pickImage;
  final picker = ImagePicker();

  // Image get from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) pickImage = File(pickedFile.path);
    Get.back();
    update();
  }

  // Image get from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) pickImage = File(pickedFile.path);
    Get.back();
    update();
  }

  void goBack() {
    Get.back();
  }

  void editProfile() {
    // View Edit Profile
  }

  void paymentMethod() {
    // View Payment Method
  }

  void language() {
    // View Language
  }

  void orderHistory() {
    // View Order History
  }

  void inviteFriend() {
    // View Invite Friend
  }

  void helpCenter() {
    // View Help Center
  }

  void onWishlist() {
    // View WishList
  }

  void coupons() {
    // view coupons
  }

  void logOut() {
    Get.back();
  }

  double getAspectRatio() {
    final width = MediaQuery.of(Get.context!).size.width;
    const extraSpacing = 60;
    const gridCount = 2;
    const fixHeight = 44;
    return ((width - extraSpacing) / gridCount) / fixHeight;
  }
}
