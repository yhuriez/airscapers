import 'package:airscaper/domain/configuration/hive_configuration.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/domain/usecases/mechanisms/load_mechanism_interactor.dart';
import 'package:airscaper/domain/usecases/mechanisms/resolve_mechanism_interactor.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecases/clues/load_available_clues_use_cases.dart';
import 'domain/usecases/clues/use_clue_use_cases.dart';
import 'domain/usecases/end/compute_completion_use_case.dart';
import 'domain/usecases/end/count_clues_use_case.dart';
import 'domain/usecases/end/end_scenario_use_case.dart';
import 'domain/usecases/end/final_score_use_case.dart';
import 'domain/usecases/end/time_used_use_case.dart';
import 'domain/usecases/init/init_app_use_case.dart';
import 'domain/usecases/init/init_start_date_use_case.dart';
import 'domain/usecases/init/load_all_scenarios_use_case.dart';
import 'domain/usecases/init/start_scenario_use_case.dart';
import 'domain/usecases/inventory/add_loot_use_case.dart';
import 'domain/usecases/inventory/filter_available_loots_use_case.dart';
import 'domain/usecases/link/interpret_link_use_case.dart';
import 'domain/usecases/link/parse_link_use_case.dart';
import 'domain/usecases/mechanisms/mechanism_code_input_use_case.dart';
import 'domain/usecases/mechanisms/mechanism_item_select_use_case.dart';


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

  sl.registerLazySingleton<InterpretLinkUseCase>(() => InterpretLinkUseCase(sl(), sl()));
  sl.registerLazySingleton<ParseLinkUseCase>(() => ParseLinkUseCase());

  sl.registerLazySingleton<LoadMechanismInteractor>(() => LoadMechanismInteractor(sl(), sl()));
  sl.registerLazySingleton<MechanismCodeInputUseCase>(() => MechanismCodeInputUseCase(sl()));
  sl.registerLazySingleton<MechanismItemSelectUseCase>(() => MechanismItemSelectUseCase(sl()));
  sl.registerLazySingleton<ResolveMechanismInteractor>(() => ResolveMechanismInteractor(sl(), sl()));

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