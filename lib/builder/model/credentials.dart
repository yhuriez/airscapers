

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Credentials {
  final String email;
  final String password;

  Credentials(this.email, this.password);
}