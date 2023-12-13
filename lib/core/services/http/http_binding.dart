import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class HttpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpManager>(
      HttpManager(
        Dio(
          BaseOptions(
            connectTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 5),
          ),
        ),
      ),
      permanent: true,
    );
  }
}
