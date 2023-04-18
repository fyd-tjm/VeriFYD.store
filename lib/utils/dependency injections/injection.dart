import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  preferRelativeImports: true,
  initializerName: 'init',
)
void configureInjection() {
  getIt.init();
  getIt.registerSingleton<AppRouter>(AppRouter());
}
