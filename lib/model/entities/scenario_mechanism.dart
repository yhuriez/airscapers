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
  String _codeHint;

  String get description => _description;

  bool get end => _endTrack != null;

  int get id => _id;

  String get image => _image;

  bool get start => _start;

  int get endTrack => _endTrack;

  String get codeHint => _codeHint;

  List<MechanismTransition> get transitions => _transitions;

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
    return map;
  }
}

class MechanismTransition {
  String _expectedCode;
  int _expectedItem;
  int _expectedTrack;
  int _stateId;
  int _transitionTo;
  String _triggerType;

  String get expectedCode => _expectedCode;

  int get expectedItemId => _expectedItem;

  int get expectedTrack => _expectedTrack;

  int get stateId => _stateId;

  int get transitionTo => _transitionTo;

  String get triggerType => _triggerType;

  MechanismTransition(this._expectedCode, this._expectedItem,
      this._expectedTrack, this._stateId, this._transitionTo);

  MechanismTransition.map(dynamic obj) {
    this._expectedCode = obj["expected_code"];
    this._expectedItem = obj["expected_item"];
    this._expectedTrack = obj["expected_track"];
    this._stateId = obj["state_id"];
    this._transitionTo = obj["transition_to"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["expected_code"] = _expectedCode;
    map["expected_item"] = _expectedItem;
    map["expected_track"] = _expectedTrack;
    map["state_id"] = _stateId;
    map["transition_to"] = _transitionTo;
    return map;
  }
}
