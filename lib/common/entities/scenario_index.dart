import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/common/entities/scenario_reference.dart';

/// Index of all available scenarios
class ScenarioIndex {
  List<ScenarioReference> _scenarios;

  List<ScenarioReference> get scenarios => _scenarios;

  ScenarioIndex(this._scenarios);

  ScenarioIndex.map(dynamic obj) {
    this._scenarios =
        mapTypedList(obj["scenarios"], (it) => ScenarioReference.map(it));
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["scenarios"] = _scenarios;
    return map;
  }
}