import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/usecases/mechanisms/load_mechanism_interactor.dart';
import 'package:airscaper/models/navigation_intent.dart';

class InterpretLinkUseCase {
  final LoadMechanismInteractor _loadMechanismUseCase;
  final ScenarioRepository _repository;

  InterpretLinkUseCase(this._loadMechanismUseCase, this._repository);

  NavigationIntent execute(String id) {
    if (!_repository.isExistingMechanism(id)) {
      return NavigationIntent.dialog(
          arguments:
              DialogArguments("QR code invalide", "Ce QR code n'existe pas pour ce scénario"));
    }

    final scenarioMechanism = _loadMechanismUseCase.execute(id);
    return NavigationIntent.mechanism(mechanism: scenarioMechanism);
  }
}
