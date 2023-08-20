import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/register/regis_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:stacked/stacked.dart';

import '../widgets/textfield.dart';

class RegisView extends StatelessWidget {
  static const String routeName = "/regis-view";
  const RegisView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<RegisViewModel>.reactive(
      viewModelBuilder: () => RegisViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const Icon(Icons.keyboard_arrow_left_rounded),
                Text(
                  Strings.actionBack,
                  style: TextStyle(
                    color: BaseColors.black,
                    fontSize: SDP.sdp(textS),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: BaseColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: SingleChildScrollView(
            child: Form(
              key: vm.formKey,
              child: Column(
                children: [
                  Image.asset(
                    illustrationRegis,
                    height: SDP.sdp(200.0),
                  ),
                  Center(
                    child: Text(
                      Strings.labelInputRegis,
                      style: boldBluePrimaryStyle.copyWith(
                        fontSize: SDP.sdp(22),
                      ),
                    ),
                  ),
                  verticalSpace(SDP.sdp(15.0)),
                  Text(
                    'Silahkan lengkapi data anda',
                    style: regulerBlackStyle.copyWith(
                      fontSize: SDP.sdp(text),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(SDP.sdp(15.0)),
                  KTextField(
                    controller: vm.nameController,
                    label: Strings.labelFullName,
                    borderColor: BaseColors.hint,
                    placeholder: 'Masukkan Nama Lengkap',
                    borderRadius: SDP.sdp(8.0),
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  KTextField(
                    controller: vm.emailController,
                    label: Strings.labelEmail,
                    borderColor: BaseColors.hint,
                    placeholder: 'Masukkan Email',
                    borderRadius: SDP.sdp(8.0),
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  KTextField(
                    controller: vm.phoneController,
                    label: Strings.labelPhone,
                    borderColor: BaseColors.hint,
                    placeholder: 'Masukkan Nomor',
                    borderRadius: SDP.sdp(8.0),
                    keyboardType: TextInputType.number,
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  KTextField(
                    controller: vm.passwordController,
                    label: Strings.labelPassword,
                    borderColor: BaseColors.hint,
                    placeholder: 'Masukkan Kata Sandi',
                    borderRadius: SDP.sdp(8.0),
                    suffixIcon: InkWell(
                        onTap: () {
                          vm.isObsecure = !vm.isObsecure;
                          vm.notifyListeners();
                        },
                        child: vm.isObsecure ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
                    obscure: vm.isObsecure,
                    maxLines: 1,
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  KTextField(
                    controller: vm.confirmPasswordController,
                    label: 'Konfirmasi Password',
                    borderColor: BaseColors.hint,
                    placeholder: 'Masukkan Ulang Kata Sandi',
                    suffixIcon: InkWell(
                        onTap: () {
                          vm.isObsecureConfimPass = !vm.isObsecureConfimPass;
                          vm.notifyListeners();
                        },
                        child: vm.isObsecureConfimPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
                    obscure: vm.isObsecureConfimPass,
                    maxLines: 1,
                  ),
                  verticalSpace(SDP.sdp(30.0)),
                  Button(
                    isLoading: vm.isBusy,
                    onPressed: () => vm.register(
                      confirmPassword: vm.confirmPasswordController.text,
                      name: vm.nameController.text,
                      email: vm.emailController.text,
                      password: vm.passwordController.text,
                      context: context,
                    ),
                    color: BaseColors.primaryBlue,
                    child: Center(
                      child: Text(
                        Strings.actionRegis,
                        style: TextStyle(
                          color: BaseColors.white,
                          fontSize: SDP.sdp(textS),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(SDP.sdp(30.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
