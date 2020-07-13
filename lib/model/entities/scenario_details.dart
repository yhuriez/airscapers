
class ScenarioDetails {
  String _title;
  int _duration;
  String _endText;

  String get title => _title;
  int get duration => _duration;
  String get endText => _endText;

  ScenarioDetails(this._title, this._duration, this._endText);

  ScenarioDetails.map(dynamic obj) {
    this._title = obj["title"];
    this._duration = obj["duration"];
    this._endText = obj["end_text"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = _title;
    map["duration"] = _duration;
    map["end_text"] = _endText;
    return map;
  }
}