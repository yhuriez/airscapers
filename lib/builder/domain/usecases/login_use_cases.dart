


import 'package:airscaper/builder/api/login/login_services.dart';
import 'package:airscaper/builder/domain/session_storage.dart';
import 'package:airscaper/builder/model/account.dart';
import 'package:airscaper/builder/model/credentials.dart';
import 'package:airscaper/builder/model/session.dart';
import 'package:airscaper/common/ars_result.dart';

class LoginUseCase {

  final LoginServices _loginServices;
  final SessionStorage _sessionStorage;

  LoginUseCase(this._loginServices, this._sessionStorage);

  Future<ARSResult<Session>> execute(Credentials credentials) async {
    final loginResponse = await _loginServices.login(credentials);

    if(loginResponse.data != null) {
      _sessionStorage.saveSession(loginResponse.data);
    }
    return loginResponse;
  }
}


class CreateAccountUseCase {

  final LoginServices _loginServices;
  final SessionStorage _sessionStorage;

  CreateAccountUseCase(this._loginServices, this._sessionStorage);

  Future<ARSResult<Session>> execute(Account account) async {
    final loginResponse = await _loginServices.createAccount(account);

    if(loginResponse.data != null) {
      _sessionStorage.saveSession(loginResponse.data);
    }
    return loginResponse;
  }
}