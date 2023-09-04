// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';


class Themes {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool loadThemeFromBox() => _box.read(_key) ?? false;
  static RxBool themeValue = false.obs;

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;


  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    themeValue.value = !themeValue.value;
    _saveThemeToBox(!loadThemeFromBox());
  }

  static final light = ThemeData.light().copyWith(
      useMaterial3: true,
      primaryColor: Colors.black,
      backgroundColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: ThemeData.dark().textTheme.apply(
        // bodyColor: Colors.white,
        //fontFamily: GoogleFonts.inter().fontFamily,
      ),
      iconTheme: ThemeData.light().iconTheme.copyWith(
        color: Colors.deepPurpleAccent,
      ));


  static final dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: Colors.white,
      backgroundColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: ThemeData.dark().textTheme.apply(
        //fontFamily: GoogleFonts.aboreto().fontFamily,
      ),
      iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: Colors.white
      )

  );
}