import 'package:my_pertamini/src/iu/views/detail_order/detail_order_view.dart';
import 'package:my_pertamini/src/iu/views/home/home_view.dart';
import 'package:my_pertamini/src/services/auth_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../iu/views/status_order/status_order_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DetailOrderView),
    MaterialRoute(page: StatusOrderView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
