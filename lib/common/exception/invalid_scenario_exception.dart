

class InvalidScenarioException implements Exception {

  String _message;

  InvalidScenarioException(this._message);

  String get message => "A scenario inconsistency has been detected : " + message;
}