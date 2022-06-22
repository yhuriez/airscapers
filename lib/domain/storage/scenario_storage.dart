

import 'package:hive/hive.dart';

class ScenarioStateStorage  {

  static const dbName = "scenarios";

  static const ScenarioKey currentIdKey = "CURRENT_ID_KEY";
  static const ScenarioKey startDateKey = "START_DATE_KEY";
  static const ScenarioKey endDateKey = "END_DATE_KEY";
  static const ScenarioKey notesKey = "NOTES_KEY";


  static const Map<ScenarioKey, dynamic> defaultValues = {
  };

  final Box _boxDb;

  static Future<Box> createBox() async {
    return Hive.openBox(dbName);
  }

  ScenarioStateStorage(this._boxDb);


  saveProperty(ScenarioKey propertyName, dynamic value) {
    _boxDb.put(propertyName, value);
  }

  dynamic getProperty(ScenarioKey propertyName) {
    return _boxDb.get(propertyName, defaultValue: defaultValues[propertyName]);
  }

  setCurrentId(String id) {
    saveProperty(currentIdKey, id);
  }

  String? getCurrentId() => getProperty(currentIdKey);

  setStartDate(DateTime date) {
    saveProperty(startDateKey,  date.millisecondsSinceEpoch);
  }

  DateTime? getStartDate() {
    int? dateMillis = getProperty(startDateKey);
    return (dateMillis == null) ? null : DateTime.fromMillisecondsSinceEpoch(dateMillis);
  }

  setEndDate(DateTime date) {
    saveProperty(endDateKey,  date.millisecondsSinceEpoch);
  }

  DateTime? getEndDate() {
    int? dateMillis = getProperty(endDateKey);
    return (dateMillis == null) ? null : DateTime.fromMillisecondsSinceEpoch(dateMillis);
  }

  Future<bool> clear() async {
    await _boxDb.clear();
    return true;
  }
}

typedef ScenarioKey = String;