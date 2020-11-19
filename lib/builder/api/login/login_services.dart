import 'dart:convert';

import 'package:airscaper/builder/api/configuration.dart';
import 'package:airscaper/builder/api/errors.dart';
import 'package:airscaper/builder/model/account.dart';
import 'package:airscaper/builder/model/credentials.dart';
import 'package:airscaper/common/ars_result.dart';

import '../../model/session.dart';

class LoginServices {

  Future<ARSResult<Session>> login(Credentials credentials) async {
    final response =
        await dio.post("/auth/login", data: jsonEncode(credentials.toJson()));
    
    return managedResponse(response, () {
      return Session.fromJson(response.data);
    });
  }

  Future<ARSResult<Session>> createAccount(Account account) async {
    final response =
    await dio.post("/auth/register", data: jsonEncode(account.toJson()));

    return managedResponse(response, () {
      return Session.fromJson(response.data);
    });
  }
}
