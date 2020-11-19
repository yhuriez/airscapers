import 'package:airscaper/builder/api/login/login_services.dart';
import 'package:airscaper/builder/domain/blocs/session_cubit.dart';
import 'package:airscaper/builder/domain/session_storage.dart';
import 'package:airscaper/builder/domain/usecases/login_use_cases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// Register dependency injection
Future<void> initDI() async {
  sl.registerLazySingleton<SessionStorage>(() => SessionStorage());
  sl.registerLazySingleton<LoginServices>(() => LoginServices());
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl(), sl()));
}

Widget initGlobalState(Widget child) {
  return MultiCubitProvider(providers: [
    CubitProvider(create: (context) {
      final cubit = SessionCubit();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cubit.init();
      });
      return cubit;
    })
  ], child: child);
}
