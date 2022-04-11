import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();
  static Future writeSecureData(
      {required String key, required String value}) async {
    var writeData = await storage.write(key: key, value: value);
    return writeData;
  }

  static Future readSecureData({required String key}) async {
    var readData = await storage.read(
      key: key,
    );
    return readData;
  }
}
