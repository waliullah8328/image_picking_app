import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picking_app/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Camera"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => controller.imagePathSet.value == false
              ? const Icon(Icons.image_not_supported_outlined,size: 80,)
              : Image.file(controller.image!)),
          TextButton.icon(
            onPressed: controller.onPressed,
            label: const Text("Next Page"),
            icon: const Icon(Icons.forward),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: controller.pickImageFromCamera,
                label: const Text("Camera"),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              TextButton.icon(
                onPressed: controller.pickImageFromGallery,
                label: const Text("Gallery"),
                icon: const Icon(Icons.camera),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
