import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picking_app/controller/home_controller.dart';

class SecondScreen extends StatelessWidget {
   SecondScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen"),),
      body: Column(
        children: [
          Obx(() => controller.imagePathSet.value == false
              ? const Icon(Icons.image_not_supported_outlined,size: 80,)
              : Image.file(controller.image!)),
        ],
      ),
    );
  }
}
