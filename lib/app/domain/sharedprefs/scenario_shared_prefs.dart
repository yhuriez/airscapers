

import 'package:shared_preferences/shared_preferences.dart';

class ScenarioSharedPrefs  {

  static const currentIdKey = "CURRENT_ID_KEY";
  static const startDateKey = "START_DATE_KEY";
  static const endDateKey = "END_DATE_KEY";

  setCurrentId(String id) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(currentIdKey, id);
  }

  Future<String> getCurrentId() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(currentIdKey);
  }

  setStartDate(DateTime date) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt(startDateKey, date.millisecondsSinceEpoch);
  }

  Future<DateTime> getStartDate() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    final dateMillis = sharedPrefs.getInt(startDateKey);
    return (dateMillis == null) ? null : DateTime.fromMillisecondsSinceEpoch(dateMillis);
  }

  setEndDate(DateTime date) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt(endDateKey, date.millisecondsSinceEpoch);
  }

  Future<DateTime> getEndDate() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    final dateMillis = sharedPrefs.getInt(endDateKey);
    return (dateMillis == null) ? null : DateTime.fromMillisecondsSinceEpoch(dateMillis);
  }

  Future<bool> clear() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();
    return true;
  }
}
