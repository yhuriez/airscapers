class ScenarioReference {
  String _id;
  String _name;
  String _image;
  String _code;
  String _linkedFile;
  String _description;

  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get code => _code;
  String get linkedFile => _linkedFile;
  String get description => _description;

  ScenarioReference(this._id, this._name, this._image, this._code, this._linkedFile, this._description);

  ScenarioReference.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._image = obj["image"];
    this._code = obj["code"];
    this._linkedFile = obj["linkedFile"];
    this._description = obj["description"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    map["code"] = _code;
    map["linkedFile"] = _linkedFile;
    map["description"] = _description;
    return map;
  }
}