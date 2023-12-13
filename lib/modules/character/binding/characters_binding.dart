import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class CharactersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ICharacterRepository>(CharacterRepository(Get.find()),
        permanent: true);
    Get.put<CharactersController>(CharactersController(Get.find()),
        permanent: true);
  }
}
