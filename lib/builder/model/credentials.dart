

import 'package:json_annotation/json_annotation.dart';

part 'credentials.g.dart';

@JsonSerializable()
class Credentials {

  static const EMAIL_KEY = "email";
  static const PASSWORD_KEY = "password";

  final String email;
  final String password;

  Credentials(this.email, this.password);

  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsToJson(this);
}