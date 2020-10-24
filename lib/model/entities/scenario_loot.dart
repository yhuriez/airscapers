class ScenarioLoot {
  String interactionText;
  int id;

  ScenarioLoot({this.interactionText, this.id});

  ScenarioLoot.map(dynamic obj) {
    interactionText = obj["interactionText"];
    id = obj["id"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["interactionText"] = interactionText;
    map["id"] = id;
    return map;
  }

}