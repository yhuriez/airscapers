// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    json['token'] as String,
    json['userId'] as String,
    json['expirationDate'] == null
        ? null
        : DateTime.parse(json['expirationDate'] as String),
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'expirationDate': instance.expirationDate?.toIso8601String(),
    };
