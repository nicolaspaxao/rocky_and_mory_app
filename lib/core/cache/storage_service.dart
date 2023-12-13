import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class StorageKeys {
  static String theme = 'THEME';
  static String locale = 'LOCALE';
}

class StorageRepository extends GetxService {
  static const _storage = FlutterSecureStorage();

  Future<void> saveLocalData(
      {required String key, required String data}) async {
    await _storage.write(key: key, value: data);
  }

  Future<String?> getLocalData({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    await _storage.delete(key: key);
  }
}
