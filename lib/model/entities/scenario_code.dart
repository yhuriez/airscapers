


import 'package:airscaper/model/entities/scenario_loot.dart';

class ScenarioCode {
  ScenarioLoot _loot;
  String _code;

  ScenarioLoot get loot => _loot;
  String get code => _code;

  ScenarioCode(this._loot, this._code);

  ScenarioCode.map(dynamic obj) {
    this._loot = (obj["loot"] != null) ? ScenarioLoot.map(obj["loot"]) :  null;
    this._code = obj["code"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["loot"] = _loot;
    map["code"] = _code;
    return map;
  }

}