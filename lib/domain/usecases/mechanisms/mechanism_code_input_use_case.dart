import 'package:airscaper/domain/usecases/mechanisms/resolve_mechanism_interactor.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_mechanism.dart';

class MechanismCodeInputUseCase {
  final ResolveMechanismInteractor _mechanismResolver;

  MechanismCodeInputUseCase(this._mechanismResolver);

  ScenarioMechanism? execute(
      ScenarioMechanism mechanism, MechanismSolvingCode solving, String code) {
    final codeFormatted = code.toLowerCase().replaceAll(" ", "");
    final validCode =
        solving.expectedCodes.any((element) => element.toLowerCase() == codeFormatted);

    if (validCode) {
      return _mechanismResolver.execute(mechanism);
    }
    return null;
  }
}
