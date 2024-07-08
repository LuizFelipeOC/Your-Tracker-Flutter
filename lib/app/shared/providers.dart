import 'package:get_it/get_it.dart';
import 'package:uno/uno.dart';
import 'package:your_tracker/app/services/client/client.dart';
import 'package:your_tracker/app/services/client/uno_client.dart';
import 'package:your_tracker/app/shared/app_url.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => Uno());
  getIt.registerLazySingleton(() => AppUrl());

  getIt.registerLazySingleton<IClient>(
    () => UnoClient(uno: getIt.get<Uno>(), appUrl: getIt.get<AppUrl>()),
  );
}
