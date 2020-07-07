import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/model/entities/scenario_details.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/model/entities/scenario_track.dart';

class Scenario {
  ScenarioDetails _details;
  List<ScenarioTrack> _tracks;
  List<ScenarioItem> _items;
  List<ScenarioMechanism> _mechanisms;

  ScenarioDetails get details => _details;

  List<ScenarioTrack> get tracks => _tracks;

  List<ScenarioItem> get items => _items;

  List<ScenarioMechanism> get mechanisms => _mechanisms;

  Scenario(this._details, this._tracks, this._items, this._mechanisms);

  Scenario.map(dynamic obj) {
    this._details = ScenarioDetails.map(obj["details"]);
    this._tracks = mapTypedList(obj["tracks"], (it) => ScenarioTrack.map(it));
    this._items = mapTypedList(obj["items"], (it) => ScenarioItem.map(it));
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
