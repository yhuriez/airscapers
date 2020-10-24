import 'scenario_loot.dart';
import 'scenario_transition.dart';

class ScenarioItem {
  int id;
  String title;
  String description;
  String foundDescription;
  bool start;
  String image;
  String codeHint;
  List<String> clues;
  bool endTrack;
  bool isTrack;
  bool isInInventory;
  bool hasQrCode;
  List<ScenarioLoot> loots;
  ScenarioTransition transition;

  ScenarioItem(
      {this.id,
      this.title,
      this.description,
      this.foundDescription,
      this.start,
      this.image,
      this.codeHint,
      this.clues,
      this.endTrack,
      this.isTrack,
      this.isInInventory,
      this.hasQrCode,
      this.loots,
      this.transition});

  ScenarioItem.map(dynamic obj) {
    id = obj["id"];
    title = obj["title"];
    description = obj["description"];
    foundDescription = obj["foundDescription"];
    start = obj["start"];
    image = obj["image"];
    codeHint = obj["codeHint"];
    clues = obj["clues"].cast<String>();
    endTrack = obj["endTrack"];
    isTrack = obj["isTrack"];
    isInInventory = obj["isInInventory"];
    hasQrCode = obj["hasQrCode"];
    if (obj["loots"] != null) {
      loots = [];
      obj["loots"].forEach((v) {
        loots.add(ScenarioLoot.map(v));
      });
    }
    transition = obj["transition"] != null
        ? ScenarioTransition.map(obj["transition"])
        : null;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["foundDescription"] = foundDescription;
    map["start"] = start;
    map["image"] = image;
    map["codeHint"] = codeHint;
    map["clues"] = clues;
    map["endTrack"] = endTrack;
    map["isTrack"] = isTrack;
    map["hasQrCode"] = hasQrCode;
    if (loots != null) {
      map["loots"] = loots.map((v) => v.toMap()).toList();
    }
    if (transition != null) {
      map["transition"] = transition.toMap();
    }
    return map;
  }
}
