
class ScenarioDetails {
  String _title;
  int _duration;

  String get title => _title;
  int get duration => _duration;

  ScenarioDetails(this._title, this._duration);

  ScenarioDetails.map(dynamic obj) {
    this._title = obj["title"];
    this._duration = obj["duration"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = _title;
    map["duration"] = _duration;
    return map;
  }
}