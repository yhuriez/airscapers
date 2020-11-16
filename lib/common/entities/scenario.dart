import 'package:airscaper/common/entities/scenario_details.dart';
import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/common/entities/scenario_item.dart';

class Scenario {
  ScenarioDetails _details;
  List<ScenarioItem> _items;

  ScenarioDetails get details => _details;

  List<ScenarioItem> get items => _items;

  Scenario(this._details, this._items);

  Scenario.map(dynamic obj) {
    this._details = ScenarioDetails.map(obj["details"]);
    this._items = mapTypedList(obj["items"], (it) => ScenarioItem.fromJson(it));
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["details"] = _details;
    map["items"] = _items;
    return map;
  }
}
