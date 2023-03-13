import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  preferRelativeImports: true,
  initializerName: 'init',
)
void configureInjection(String env) => getIt.init(environment: env);
