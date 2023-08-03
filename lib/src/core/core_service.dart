import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CoreService {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
}
