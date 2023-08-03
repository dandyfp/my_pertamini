import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
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
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
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
          child: Column(
            children: [
              verticalSpace(
                SDP.sdp(50.0),
              ),
              Center(
                child: Text(
                  Strings.labelInputRegis,
                  style: TextStyle(
                    fontSize: SDP.sdp(body),
                    color: BaseColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(SDP.sdp(50.0)),
              KTextField(
                controller: nameController,
                label: Strings.labelFullName,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan Nama Lengkap',
              ),
              verticalSpace(SDP.sdp(10.0)),
              KTextField(
                controller: emailController,
                label: Strings.labelEmail,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan Email',
              ),
              verticalSpace(SDP.sdp(10.0)),
              KTextField(
                controller: phoneController,
                label: Strings.labelPhone,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan Nomor',
              ),
              verticalSpace(SDP.sdp(10.0)),
              KTextField(
                controller: passwordController,
                label: Strings.labelPassword,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan Kata Sandi',
              ),
              verticalSpace(SDP.sdp(30.0)),
              Button(
                isLoading: vm.isBusy,
                onPressed: () => vm.register(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  context: context,
                ),
                color: BaseColors.primary,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
