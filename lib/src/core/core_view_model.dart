import 'package:flutter/cupertino.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CoreViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;
}
