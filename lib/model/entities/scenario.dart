import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/model/entities/scenario_code.dart';
import 'package:airscaper/model/entities/scenario_details.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';

class Scenario {
  ScenarioDetails _details;
  List<ScenarioTrack> _tracks;
  List<ScenarioItem> _items;
  List<ScenarioMechanism> _mechanisms;
  List<ScenarioCode> _codes;

  ScenarioDetails get details => _details;

  List<ScenarioTrack> get tracks => _tracks;

  List<ScenarioItem> get items => _items;

  List<ScenarioMechanism> get mechanisms => _mechanisms;

  List<ScenarioCode> get codes => _codes;

  Scenario(this._details, this._tracks, this._items, this._mechanisms, this._codes);

  Scenario.map(dynamic obj) {
    this._details = ScenarioDetails.map(obj["details"]);
    this._tracks = mapTypedList(obj["tracks"], (it) => ScenarioTrack.map(it));
    this._items = mapTypedList(obj["items"], (it) => ScenarioItem.map(it));
    this._codes = mapTypedList(obj["codes"], (it) => ScenarioCode.map(it));
    this._mechanisms =
        mapTypedList(obj["mechanisms"], (it) => ScenarioMechanism.map(it));
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["details"] = _details;
    map["tracks"] = _tracks;
    map["items"] = _items;
    map["mechanisms"] = _mechanisms;
    return map;
  }
}
