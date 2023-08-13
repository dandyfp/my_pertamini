import 'package:my_pertamini/src/enum/dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../iu/views/widgets/dialog/information_dialog.dart';

void setupDialog() {
  var dialogService = locator<DialogService>();

  final builders = {
    Dialog.dialogInfo: (context, sheetRequest, completer) => InformationDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
