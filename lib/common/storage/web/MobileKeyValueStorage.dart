

import 'package:airscaper/common/storage/KeyValueStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MobileKeyValueStorage extends KeyValueStorage {
  @override
  void clear() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();
  }

  @override
  Future<String> getString(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(key);
  }

  @override
  Future<int> getInt(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getInt(key);
  }

  @override
  Future<bool> getBool(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(key);
  }

  @override
  void setBool(String key, bool value) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(key, value);
  }

  @override
  void setInt(String key, int value) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt(key, value);
  }

  @override
  void setString(String key, String value) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(key, value);
  }
}

KeyValueStorage getStorage() => MobileKeyValueStorage();