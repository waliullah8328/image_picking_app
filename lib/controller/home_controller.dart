import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picking_app/routes/routes.dart';

class HomeController extends GetxController{


  File? image;
  RxBool imagePathSet = false.obs;

  Future<File?> pickImage(ImageSource imageSource) async {
    File? imageFile;

    try {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        debugPrint(pickedImage.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageFile;
  }

  Future<void> pickImageFromCamera() async {
    image = await pickImage(ImageSource.camera);
    imagePathSet.value = true;


  }

  Future<void> pickImageFromGallery() async {
    image = await pickImage(ImageSource.gallery);
    imagePathSet.value = true;


  }

  void onPressed() {
    Get.toNamed(Routes.secondScreen);
  }
}