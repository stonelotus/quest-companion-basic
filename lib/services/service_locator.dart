import 'package:get_it/get_it.dart';
import 'package:quest_companion/services/misc/misc_service.dart';
import 'package:quest_companion/services/user_service/user_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<MiscService>(MiscService());
  getIt.registerSingleton<UserService>(UserService());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<MiscService>(MiscService());
}
