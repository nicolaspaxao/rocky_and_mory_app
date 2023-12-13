import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

export './core/export.dart';
export './modules/export.dart';
export './shared/export.dart';
export './design/design.dart';

final charactersController = Get.find<CharactersController>();
final storage = Get.find<StorageRepository>();
final themeController = Get.find<ThemeController>();
