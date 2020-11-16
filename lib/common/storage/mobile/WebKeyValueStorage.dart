

import 'package:airscaper/common/storage/KeyValueStorage.dart';


class WebKeyValueStorage extends KeyValueStorage {
  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  Future<bool> getBool(String key) {
    // TODO: implement getBool
    throw UnimplementedError();
  }

  @override
  Future<int> getInt(String key) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Future<String> getString(String key) {
    // TODO: implement getString
    throw UnimplementedError();
  }

  @override
  void setBool(String key, bool value) {
    // TODO: implement setBool
  }

  @override
  void setInt(String key, int value) {
    // TODO: implement setInt
  }

  @override
  void setString(String key, String value) {
    // TODO: implement setString
  }

}

KeyValueStorage getStorage() => WebKeyValueStorage();