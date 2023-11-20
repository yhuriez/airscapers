import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/models/scenario_reference.dart';
import 'package:collection/collection.dart';


/// Start the scenario timer
class InitStartDateUseCase {
  final ScenarioStateStorage _sharedPrefs;

  InitStartDateUseCase(this._sharedPrefs);

  DateTime execute() {
    var startDate = _sharedPrefs.getStartDate();
    if (startDate == null) {
      startDate = DateTime.now();
      _sharedPrefs.setStartDate(startDate);
    }

    return startDate;
  }
}
