import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:stacked/stacked.dart';

class DetailOrderViewMoldel extends BaseViewModel with CoreViewModel {
  void showStatusOrderView() => navigationService.navigateToStatusOrderView();
}
