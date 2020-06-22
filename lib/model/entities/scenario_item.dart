
const String itemKey = "item";

class ScenarioItem {
  String _description;
  int _id;
  String _image;
  String _title;
  String _foundDescription;

  String get description => _description;
  String get foundDescription => _foundDescription;
  int get id => _id;
  String get image => _image;
  String get title => _title;

  ScenarioItem(this._description, this._foundDescription, this._id, this._image, this._title);

  ScenarioItem.map(dynamic obj) {
    this._description = obj["description"];
    this._foundDescription = obj["found_description"];
    this._id = obj["id"];
    this._image = obj["image"];
    this._title = obj["title"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["description"] = _description;
    map["found_description"] = _foundDescription;
    map["id"] = _id;
    map["image"] = _image;
    map["title"] = _title;
    return map;
  }

}