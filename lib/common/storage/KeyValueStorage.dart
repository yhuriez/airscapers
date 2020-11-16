import 'package:airscaper/common/storage/stubs.dart'
  if (dart.library.io) 'package:airscaper/common/storage/mobile/MobileKeyValueStorage.dart'
  if (dart.library.html) 'package:airscaper/common/storage/web/WebKeyValueStorage.dart';


abstract class KeyValueStorage {
  static KeyValueStorage _instance;

  static KeyValueStorage get instance {
    _instance ??= getStorage();
    return _instance;
  }

  void setString(String key, String value);

  Future<String> getString(String key);

  void setInt(String key, int value);

  Future<int> getInt(String key);

  void setBool(String key, bool value);

  Future<bool> getBool(String key);

  void clear();
}
