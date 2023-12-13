import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

import 'core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DepInj.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    themeController.loadThemMode();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ricky and Morty',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      getPages: AppPages.pages,
      initialRoute: Routes.HOME,
    );
  }
}
