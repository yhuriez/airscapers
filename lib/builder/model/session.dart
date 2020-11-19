

import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final User user;
  final Tokens tokens;

  Session(this.user, this.tokens);

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  final String role;
  final String name;
  final String email;

  User(this.id, this.role, this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Tokens {
  final TokenItem access;
  final TokenItem refresh;

  Tokens(this.access, this.refresh);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  Map<String, dynamic> toJson() => _$TokensToJson(this);
}

@JsonSerializable()
class TokenItem {
  final String token;
  final String expires;

  TokenItem(this.token, this.expires);

  factory TokenItem.fromJson(Map<String, dynamic> json) => _$TokenItemFromJson(json);

  Map<String, dynamic> toJson() => _$TokenItemToJson(this);
}