import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/model/managers/timer_manager.dart';
import 'package:airscaper/model/sharedprefs/scenario_shared_prefs.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:get_it/get_it.dart';

import 'model/database.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // region Use Cases
  sl.registerLazySingleton<InitAppUseCase>(() => InitAppUseCase(sl()));
  sl.registerLazySingleton<InitScenarioIndexUseCase>(() => InitScenarioIndexUseCase(sl()));
  sl.registerLazySingleton<RegisterScenarioUseCase>(() => RegisterScenarioUseCase(sl()));
  sl.registerLazySingleton<InitStartDateUseCase>(() => InitStartDateUseCase(sl()));
  sl.registerLazySingleton<StartScenarioUseCase>(() => StartScenarioUseCase(sl(), sl()));
  sl.registerLazySingleton<EndScenarioUseCase>(() => EndScenarioUseCase(sl(), sl(), sl()));
  sl.registerLazySingleton<LoadAllScenariosUseCase>(() => LoadAllScenariosUseCase(sl()));

  sl.registerLazySingleton<AddLootUseCase>(() => AddLootUseCase(sl()));
  sl.registerLazySingleton<FilterAvailableLootUseCase>(() => FilterAvailableLootUseCase(sl()));

  sl.registerLazySingleton<InterpretLinkUseCase>(() => InterpretLinkUseCase(sl(), sl()));
  sl.registerLazySingleton<ParseLinkUseCase>(() => ParseLinkUseCase());

  sl.registerLazySingleton<LoadCurrentMechanismStateUseCase>(() => LoadCurrentMechanismStateUseCase(sl()));
  sl.registerLazySingleton<MechanismCodeInputUseCase>(() => MechanismCodeInputUseCase(sl(), sl()));
  sl.registerLazySingleton<MechanismItemSelectUseCase>(() => MechanismItemSelectUseCase(sl(), sl()));
  sl.registerLazySingleton<StateTransitionUseCase>(() => StateTransitionUseCase(sl(), sl()));
  sl.registerLazySingleton<MechanismFinishedUseCase>(() => MechanismFinishedUseCase(sl(), sl()));
  sl.registerLazySingleton<LoadAvailableCluesUseCase>(() => LoadAvailableCluesUseCase(sl()));
  sl.registerLazySingleton<UseClueUseCase>(() => UseClueUseCase(sl(), sl()));
  // endregion


  // region Repositories
  sl.registerLazySingleton<ScenarioRepository>(() => ScenarioRepository());
  // endregion

  // region Managers
  sl.registerLazySingleton<TimerManager>(() => TimerManager());
  // endregion

  // region Storage
  sl.registerLazySingleton<ScenarioSharedPrefs>(() => ScenarioSharedPrefs());
  sl.registerLazySingleton<InventoryLocalSource>(() => InventoryLocalSource(sl()));
  sl.registerLazySingleton<InventoryDatabase>(() => InventoryDatabase());
  // endregion
}