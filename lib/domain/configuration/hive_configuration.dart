
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


const hiveKey = "hive_key";

Future<void> initHive() async {
  await Hive.initFlutter("database");
}

class JsonTypeAdapter<T> extends TypeAdapter<T> {
  final int typeId;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  JsonTypeAdapter(this.typeId, this.fromJson, this.toJson);

  @override
  T read(BinaryReader reader) {
    final jsonMap = jsonDecode(reader.readString());
    return fromJson(jsonMap);
  }

  @override
  void write(BinaryWriter writer, T obj) {
    final jsonStr = jsonEncode(toJson(obj));
    writer.writeString(jsonStr);
  }
}