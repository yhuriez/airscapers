import 'package:airscaper/domain/configuration/hive_configuration.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/usecases/end_use_cases.dart';
import 'package:airscaper/domain/usecases/init_use_cases.dart';
import 'package:airscaper/domain/usecases/inventory_use_cases.dart';
import 'package:airscaper/domain/usecases/link_use_cases.dart';
import 'package:airscaper/domain/usecases/mechanism_use_cases.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> init() async {

  // region Use Cases
  sl.registerLazySingleton<InitAppUseCase>(() => InitAppUseCase(sl(), sl(), sl()));
  sl.registerLazySingleton<InitStartDateUseCase>(() => InitStartDateUseCase(sl()));
  sl.registerLazySingleton<StartScenarioUseCase>(() => StartScenarioUseCase(sl(), sl()));
  sl.registerLazySingleton<LoadAllScenariosUseCase>(() => LoadAllScenariosUseCase(sl()));

  sl.registerLazySingleton<EndScenarioUseCase>(() => EndScenarioUseCase(sl(), sl(), sl()));
  sl.registerLazySingleton<ComputeCompletionUseCase>(() => ComputeCompletionUseCase(sl(), sl()));
  sl.registerLazySingleton<CountCluesUseCase>(() => CountCluesUseCase(sl()));
  sl.registerLazySingleton<TimeUsedUseCase>(() => TimeUsedUseCase(sl()));
  sl.registerLazySingleton<FinalScoreUseCase>(() => FinalScoreUseCase(sl(), sl(), sl()));

  sl.registerLazySingleton<AddLootUseCase>(() => AddLootUseCase(sl()));
  sl.registerLazySingleton<FilterAvailableLootUseCase>(() => FilterAvailableLootUseCase(sl()));

  sl.registerLazySingleton<InterpretLinkUseCase>(() => InterpretLinkUseCase(sl(), sl(), sl()));
  sl.registerLazySingleton<ParseLinkUseCase>(() => ParseLinkUseCase());

  sl.registerLazySingleton<LoadCurrentMechanismStateUseCase>(() => LoadCurrentMechanismStateUseCase(sl()));
  sl.registerLazySingleton<MechanismCodeInputUseCase>(() => MechanismCodeInputUseCase(sl(), sl()));
  sl.registerLazySingleton<MechanismItemSelectUseCase>(() => MechanismItemSelectUseCase(sl(), sl()));
  sl.registerLazySingleton<StateTransitionUseCase>(() => StateTransitionUseCase(sl(), sl(), sl()));
  sl.registerLazySingleton<MechanismFinishedUseCase>(() => MechanismFinishedUseCase(sl(), sl(), sl()));

  sl.registerLazySingleton<LoadAvailableCluesUseCase>(() => LoadAvailableCluesUseCase(sl()));
  sl.registerLazySingleton<UseClueUseCase>(() => UseClueUseCase(sl(), sl()));
  // endregion

  // region Repositories
  sl.registerLazySingleton<ScenarioRepository>(() => ScenarioRepository());
  // endregion

  // region Storage
  await initHive();

  final scenarioDb = await ScenarioStateStorage.createBox();
  final itemDb = await InventoryLocalSource.createItemBox(1);
  final mechanismDb = await InventoryLocalSource.createMechanismBox(2);
  final clueDb = await InventoryLocalSource.createClueBox(3);

  sl.registerLazySingleton<ScenarioStateStorage>(() => ScenarioStateStorage(scenarioDb));
  sl.registerLazySingleton<InventoryLocalSource>(() => InventoryLocalSource(itemDb, mechanismDb, clueDb));
  // endregion
}