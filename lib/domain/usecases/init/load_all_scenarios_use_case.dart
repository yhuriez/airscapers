import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/models/scenario_reference.dart';


/// Provide the list of all available scenario
class LoadAllScenariosUseCase {
  final ScenarioRepository _repository;

  LoadAllScenariosUseCase(this._repository);

  Map<String, ScenarioReference> execute() {
    return Map.fromIterable(_repository.scenarios,
        key: (it) => it.code, value: (it) => it);
  }
}