import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/usecases/mechanisms/load_mechanism_interactor.dart';
import 'package:airscaper/models/navigation_intent.dart';

class InterpretLinkUseCase {
  final ScenarioStateStorage _scenarioStateStorage;
  final LoadMechanismInteractor _loadMechanismUseCase;

  InterpretLinkUseCase(this._scenarioStateStorage, this._loadMechanismUseCase);

  NavigationIntent execute(String id) {
    final scenarioMechanism = _loadMechanismUseCase.execute(id);

    if (scenarioMechanism != null) {
      if (scenarioMechanism.endTrack) {
        _scenarioStateStorage.setEndDate(DateTime.now());
        return NavigationIntent.success();
      }

      return NavigationIntent.mechanism(mechanism: scenarioMechanism);
    } else {
      return NavigationIntent.dialog(
          arguments:
              DialogArguments("QR code invalide", "Ce QR code n'existe pas pour ce scénario"));
    }
  }
}
