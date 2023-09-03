import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/core/core_view_model.dart';
import 'package:stacked/stacked.dart';

class UserOrderViewModel extends BaseViewModel with CoreViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void showFuelView() => navigationService.navigateToFuelOrderView();
}
