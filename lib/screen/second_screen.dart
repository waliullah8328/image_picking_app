import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picking_app/controller/home_controller.dart';
import 'package:image_picking_app/utils/theme.dart';

class SecondScreen extends StatelessWidget {
   SecondScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        actions: [
          Row(
            children: [
              const Text("Change Mode"),
              Obx(() => Switch(
                  value: Themes.themeValue.value,
                  onChanged: (value){
                    Themes().switchTheme();

                  }
              )),

            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(() => controller.imagePathSet.value == false
              ? const Icon(Icons.image_not_supported_outlined,size: 80,)
              : Image.file(controller.image!)),
          const Text("This is a picture"),
        ],

      ),
    );
  }
}
