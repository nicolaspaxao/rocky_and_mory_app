import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ricky and Morty ',
      getPages: AppPages.pages,
      initialRoute: Routes.HOME,
    );
  }
}
