import 'package:bloc_deep_dive/environment/getIt/getit.config.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> setUpGetItConfig() async {
  await locator.init();
}
