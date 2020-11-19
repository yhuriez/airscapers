


import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  
  static const NAME_KEY = "name";
  static const EMAIL_KEY = "email";
  static const PASSWORD_KEY = "password";
  
  final String name;
  final String email;
  final String password;

  Account(this.name, this.email, this.password);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}