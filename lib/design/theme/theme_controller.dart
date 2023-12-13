import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  Future<void> setMode(String themeText) async {
    ThemeMode themeMode = themeModes[themeText]!;
    Get.changeThemeMode(themeMode);
    await storage.saveLocalData(key: StorageKeys.theme, data: themeText);
  }

  void loadThemMode() async {
    String themeText =
        await storage.getLocalData(key: StorageKeys.theme) ?? 'light';
    isDark.value = themeText == 'dark' ? true : false;
    await setMode(themeText);
  }

  Future<void> changeTheme() async {
    await setMode(isDark.value ? 'light' : 'dark');
    isDark.value = !isDark.value;
  }
}
