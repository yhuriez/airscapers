import 'package:airscaper/common/exception/invalid_scenario_exception.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/usecases/mechanisms/resolve_mechanism_interactor.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'load_mechanism_interactor.dart';

class MechanismItemSelectUseCase {
  final ResolveMechanismInteractor _mechanismResolver;

  MechanismItemSelectUseCase(this._mechanismResolver);

  ScenarioMechanism? execute(
      ScenarioMechanism mechanism, MechanismSolvingUse solving, String itemId) {
    final valid = solving.expectedItem == itemId;

    if (valid) {
      return _mechanismResolver.execute(mechanism);
    }
    return null;
  }
}
