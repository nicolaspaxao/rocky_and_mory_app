import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class DepInj {
  static init() {
    Get.put<StorageRepository>(StorageRepository());
    Get.put<ThemeController>(ThemeController());
  }
}
