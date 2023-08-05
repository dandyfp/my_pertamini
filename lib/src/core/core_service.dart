import 'package:dio/dio.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../network/api_service.dart';

class CoreService {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  ApiService apiService = ApiService(Dio());
}
