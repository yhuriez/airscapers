

import 'package:airscaper/common/helpers.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';

const String trackKey = "track";

class ScenarioTrack {
  String _description;
  String _foundDescription;
  int _id;
  String _image;
  String _title;
  bool _endTrack;
  List<ScenarioLoot> _loots;
  bool hasQrCode;

  String get description => _description;
  String get foundDescription => _foundDescription;
  int get id => _id;
  String get image => _image;
  String get title => _title;
  bool get endTrack => _endTrack;
  List<ScenarioLoot> get loots => _loots;

  ScenarioTrack(this._description, this._id, this._image, this._title, this._endTrack, this._loots, this.hasQrCode);

  ScenarioTrack.map(dynamic obj) {
    this._description = obj["description"];
    this._foundDescription = obj["found_description"];
    this._id = obj["id"];
    this._image = obj["image"];
    this._title = obj["title"];
    this._endTrack = obj["end_track"] ?? false;
    this._loots = mapTypedList(obj["loots"], (it) => ScenarioLoot.map(it));
    this.hasQrCode = obj["hasQrCode"] ?? false;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["description"] = _description;
    map["found_description"] = _foundDescription;
    map["id"] = _id;
    map["image"] = _image;
    map["title"] = _title;
    map["end_track"] = _endTrack;
    map["loots"] = _loots;
    return map;
  }

}