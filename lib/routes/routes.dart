import 'package:get/get.dart';
import 'package:image_picking_app/screen/home_screen.dart';
import 'package:image_picking_app/screen/second_screen.dart';

class Routes{
  static const String homeScreen = "/homeScreen";
  static const String secondScreen = "/secondScreen";

  static  List<GetPage> list =[
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
        name: secondScreen,
        page: () => SecondScreen(),
    ),
  ];

}