import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../enum/snackbar_type.dart';
import '../iu/shared/colors.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.warning,
    config: SnackbarConfig(
      backgroundColor: BaseColors.red,
      textColor: BaseColors.white,
      mainButtonTextColor: BaseColors.black,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: BaseColors.purpleSoft,
      textColor: BaseColors.white,
      mainButtonTextColor: BaseColors.black,
    ),
  );
}
