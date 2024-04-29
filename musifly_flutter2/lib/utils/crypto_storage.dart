import 'package:hive_flutter/adapters.dart';

const kPassword = 'cryptoverymuchcryptoverymuchcryp'; // 32 length
const kBoxName = 'encryptedencryptedencryptedencry'; // 32 length

abstract class Storage {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(
      kBoxName,
      encryptionCipher: HiveAesCipher(
        kPassword.codeUnits,
      ),
    );
  }

  static Future<void> put(String key, String value) async {
    final box = Hive.box(kBoxName);
    if (!box.isOpen) throw Exception('storage box is not open!');
    await box.put(key, value);
  }

  static String? get(String key) {
    final box = Hive.box(kBoxName);
    if (!box.isOpen) throw Exception('storage box is not open!');
    return box.get(key) as String?;
  }

  static Future<void> remove(String key) async {
    final box = Hive.box(kBoxName);
    if (!box.isOpen) throw Exception('storage box is not open!');
    return await box.delete(key);
  }
}
