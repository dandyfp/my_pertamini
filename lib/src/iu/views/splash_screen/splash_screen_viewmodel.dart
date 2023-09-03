import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:my_pertamini/src/helpers/shared_preferences_helper.dart';
import 'package:my_pertamini/src/iu/views/main/main_view.dart';
import 'package:stacked/stacked.dart';

import '../../../constans/config.dart';

class SplashSreenViewModel extends FutureViewModel with CoreViewModel {
  String? token;
  String? role;
  @override
  Future futureToRun() => check();

  check() async {
    setBusy(true);
    token = SharedPreferencesHelper().getString(Config.session);
    role = SharedPreferencesHelper().getString('role');
    if (token == null) {
      Future.delayed(const Duration(seconds: 2), showLogin);
    } else {
      Future.delayed(const Duration(seconds: 2), showHome);
    }
    setBusy(false);
    notifyListeners();
  }

  void showLogin() => navigationService.clearStackAndShow(Routes.loginView);
  void showHome() => navigationService.clearStackAndShowView(MainView(admin: role ?? ''));
}
