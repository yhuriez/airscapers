import 'package:airscaper/common/helpers.dart';

const String mechanismKey = "mechanism";

class ScenarioMechanism {
  int _id;
  String _name;
  List<MechanismState> _states;

  int get id => _id;

  String get name => _name;

  List<MechanismState> get states => _states;

  ScenarioMechanism(this._id, this._states);

  ScenarioMechanism.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._states = mapTypedList(obj["states"], (it) => MechanismState.map(it));
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["states"] = _states;
    return map;
  }
}

class MechanismState {
  String _description;
  int _id;
  String _image;
  bool _start;
  int _endTrack;
  List<MechanismTransition> _transitions;
  List<MechanismClue> _clues;
  String _codeHint;

  String get description => _description;

  bool get end => _endTrack != null;

  int get id => _id;

  String get image => _image;

  bool get start => _start;

  int get endTrack => _endTrack;

  String get codeHint => _codeHint;

  List<MechanismTransition> get transitions => _transitions;

  List<MechanismClue> get clues => _clues;

  MechanismState(this._description, this._id, this._image, this._start,
      this._endTrack, this._transitions, this._codeHint);

  MechanismState.map(dynamic obj) {

    this._id = obj["id"];
    this._start = obj["start"] ?? false;
    this._description = obj["description"];
    this._image = obj["image"];
    this._endTrack = obj["end_track"];
    this._transitions =
        mapTypedList(obj["transitions"], (it) => MechanismTransition.map(it));
    this._codeHint = obj["code_hint"];

    // Clues
    final List<String> cluesString = obj["clues"]?.cast<String>();
    var index = 0;
    this._clues = cluesString?.map((value) {
      index++;
      final id = this.id * 10 + index + 1;
      return MechanismClue(id: id, description: value);
    })?.toList();
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["description"] = _description;
    map["id"] = _id;
    map["image"] = _image;
    map["start"] = _start;
    map["end_track"] = _endTrack;
    map["transitions"] = _transitions;
    map["code_hint"] = _codeHint;
    map["clues"] = _clues;
    return map;
  }
}

class MechanismTransition {
  List<String> _expectedCodes;
  int _expectedItem;
  int _expectedTrack;
  List<int> _expectedItemList;

  int _stateId;
  int _transitionTo;
  List<int> _removedItems;

  List<String> get expectedCodes => _expectedCodes;

  int get expectedItemId => _expectedItem;

  int get expectedTrack => _expectedTrack;

  List<int> get expectedItemList => _expectedItemList;

  int get stateId => _stateId;

  int get transitionTo => _transitionTo;

  List<int> get removedItems => _removedItems;


  MechanismTransition(this._expectedCodes, this._expectedItem,
      this._expectedTrack, this._expectedItemList, this._stateId, this._transitionTo, this._removedItems);

  MechanismTransition.map(dynamic obj) {
    this._expectedCodes = obj["expected_codes"];
    this._expectedItem = obj["expected_item"];
    this._expectedTrack = obj["expected_track"];
    this._expectedItemList = obj["expected_item_list"]?.cast<int>();
    this._stateId = obj["state_id"];
    this._transitionTo = obj["transition_to"];
    this._removedItems = mapTypedList(obj["removed_items"], (it) => it as int);
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["expected_codes"] = _expectedCodes;
    map["expected_item"] = _expectedItem;
    map["expected_track"] = _expectedTrack;
    map["expected_item_list"] = _expectedItemList;
    map["state_id"] = _stateId;
    map["transition_to"] = _transitionTo;
    map["removed_items"] = _removedItems;
    return map;
  }
}


class MechanismClue {
  int id;
  String description;

  MechanismClue({this.id, this.description});

  MechanismClue.map(dynamic obj) {
    id = obj["id"];
    description = obj["description"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["description"] = description;
    return map;
  }

}