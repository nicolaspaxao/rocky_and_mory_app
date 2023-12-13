import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const CharactersListPage(),
      bindings: [HttpBinding(), CharactersBinding()],
    )
  ];
}
