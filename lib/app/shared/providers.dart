import 'package:get_it/get_it.dart';
import 'package:uno/uno.dart';
import 'package:your_tracker/app/controller/packages/search_package_controller.dart';
import 'package:your_tracker/app/data/package/search_package/search_package_repository.dart';
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

  getIt.registerSingleton(SearchPackageRepository(client: getIt.get<IClient>()));
  getIt.registerSingleton(
    SearchPackageController(searchPackageRepository: getIt.get<SearchPackageRepository>()),
  );
}
