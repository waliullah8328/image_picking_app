import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picking_app/routes/routes.dart';
import 'package:image_picking_app/screen/home_screen.dart';
import 'package:image_picking_app/utils/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: Themes().theme,
      darkTheme: Themes.dark,
      getPages: Routes.list,
      initialRoute: Routes.homeScreen,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          image == null
              ? const Icon(Icons.image_not_supported_outlined,size: 80,)
              : Image.file(image!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: _pickImageFromCamera,
                label: const Text("Camera"),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              TextButton.icon(
                onPressed: _pickImageFromGallery,
                label: const Text("Gallery"),
                icon: const Icon(Icons.camera),
              ),
            ],
          ),
        ],
      ),
    );
  }

  File? image;

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

  Future<void> _pickImageFromCamera() async {
    image = await pickImage(ImageSource.camera);
    setState(() {

    });

  }

  Future<void> _pickImageFromGallery() async {
    image = await pickImage(ImageSource.gallery);
    setState(() {

    });

  }
}
