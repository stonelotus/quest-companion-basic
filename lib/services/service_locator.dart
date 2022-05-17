import 'package:get_it/get_it.dart';
import 'package:quest_companion/services/misc/misc_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<MiscService>(MiscService());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<MiscService>(MiscService());
}
