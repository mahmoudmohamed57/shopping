import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoply/utils/storage_manager.dart';

class ThemeController {
  final AppStorage _appStorage = AppStorage(GetStorage());

  ThemeMode get themeDataGet =>
      _appStorage.getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
      _appStorage.getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark,
    );
    _appStorage.setThemeDataInBox(!_appStorage.getThemeDataFromBox());
  }
}
