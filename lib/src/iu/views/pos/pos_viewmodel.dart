import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:stacked/stacked.dart';

class PosViewModel extends BaseViewModel with CoreViewModel {
  void showPosPeopleView() => navigationService.navigateToPosPeopleView();
  void showPosTransactionView() => navigationService.navigateToPosTransactionView();
  void showPosFuelView() => navigationService.navigateToPosFuelView();
  void showPosDeliveryView() => navigationService.navigateToPosDeliveryView();
}
