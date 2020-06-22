class ScenarioLoot {
  String _type;
  int _id;
  String _interactionText;

  String get type => _type;
  int get id => _id;
  String get interactionText => _interactionText;

  ScenarioLoot(this._type, this._id);

  ScenarioLoot.map(dynamic obj) {
    this._type = obj["type"];
    this._id = obj["id"];
    this._interactionText = obj["interaction_text"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = _type;
    map["id"] = _id;
    map["interaction_text"] = _interactionText;
    return map;
  }
}