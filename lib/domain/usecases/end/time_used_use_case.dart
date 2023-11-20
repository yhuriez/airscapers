
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';

class TimeUsedUseCase {

  final ScenarioStateStorage _sharedPrefs;

  TimeUsedUseCase(this._sharedPrefs);

  int execute() {
    final startDate = _sharedPrefs.getStartDate();
    final endDate = _sharedPrefs.getEndDate();

    if(startDate == null || endDate == null) {
      throw new Exception("A start date and an end date should have been given at this point");
    }

    final durationLeft = endDate.difference(startDate);
    return durationLeft.inSeconds;
  }
}