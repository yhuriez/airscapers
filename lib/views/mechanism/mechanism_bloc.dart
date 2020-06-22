



import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class MechanismBloc extends Bloc<bool, MechanismState> {

  final ScenarioMechanism mechanism;

  final LoadCurrentMechanismStateUseCase _loadCurrentMechanismStateUseCase = sl();

  MechanismBloc(this.mechanism);

  @override
  MechanismState get initialState => null;

  @override
  Stream<MechanismState> mapEventToState(bool event) async* {
    final newState = await _loadCurrentMechanismStateUseCase.execute(mechanism);
    yield newState;
  }
}


class MechanismScreenState {
  final MechanismState currentState;
  final List<MechanismTransition> availableTransitions;

  MechanismScreenState(this.currentState, this.availableTransitions);
}