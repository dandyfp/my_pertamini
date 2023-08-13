import 'package:flutter/cupertino.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/helpers/shared_preferences_helper.dart';
import 'package:stacked_services/stacked_services.dart';

import '../enum/dialog.dart';
import '../iu/shared/images.dart';

mixin CoreViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;

  void back() => navigationService.back();

  void showInformationDialog(
    bool isSuccess,
    String message,
  ) {
    dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: Dialog.dialogInfo,
      imageUrl: isSuccess ? successAnimation : failedAnimation,
      title: isSuccess ? 'Berhasil' : 'Gagal',
      description: message,
    );
  }

  void logut() {
    SharedPreferencesHelper().clearAll();
    navigationService.clearStackAndShow(Routes.splashScreenView);
  }
}
