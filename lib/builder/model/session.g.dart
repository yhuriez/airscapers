// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['tokens'] == null
        ? null
        : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['role'] as String,
    json['name'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'name': instance.name,
      'email': instance.email,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) {
  return Tokens(
    json['access'] == null
        ? null
        : TokenItem.fromJson(json['access'] as Map<String, dynamic>),
    json['refresh'] == null
        ? null
        : TokenItem.fromJson(json['refresh'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };

TokenItem _$TokenItemFromJson(Map<String, dynamic> json) {
  return TokenItem(
    json['token'] as String,
    json['expires'] as String,
  );
}

Map<String, dynamic> _$TokenItemToJson(TokenItem instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };
