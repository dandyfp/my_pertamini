import 'package:get_it/get_it.dart';

import '../helpers/shared_preferences_helper.dart';

GetIt locatorLocal = GetIt.instance;

Future setupInjector() async {
  SharedPreferencesHelper? sharedPreferencesManager =
      await SharedPreferencesHelper.getInstance();
  locatorLocal
      .registerSingleton<SharedPreferencesHelper>(sharedPreferencesManager!);
}
