import 'package:my_pertamini/src/iu/views/cart/cart_view.dart';
import 'package:my_pertamini/src/iu/views/detail_order/detail_order_view.dart';
import 'package:my_pertamini/src/iu/views/home/home_view.dart';
import 'package:my_pertamini/src/iu/views/main/main_view.dart';
import 'package:my_pertamini/src/iu/views/register/regis_view.dart';
import 'package:my_pertamini/src/services/auth_service.dart';
import 'package:my_pertamini/src/services/user_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../iu/views/login/login_view.dart';
import '../iu/views/splash_screen/splash_screen_view.dart';
import '../iu/views/status_order/status_order_view.dart';
import '../services/fuel_service.dart';
import '../services/transaction_service.dart';
import '../services/vehicle_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DetailOrderView),
    MaterialRoute(page: StatusOrderView),
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: CartView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FuelService),
    LazySingleton(classType: TransactionService),
    LazySingleton(classType: VehicleService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
