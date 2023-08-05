import 'package:get_it/get_it.dart';

import '../shared_preferences_helper.dart';

GetIt locatorLocal = GetIt.instance;

Future setupInjector() async {
  SharedPreferencesHelper? sharedPreferencesManager = await SharedPreferencesHelper.getInstance();
  locatorLocal.registerSingleton<SharedPreferencesHelper>(sharedPreferencesManager!);
}
