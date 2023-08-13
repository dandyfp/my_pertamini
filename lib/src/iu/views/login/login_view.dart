import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/helpers/validator/validator.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/login/login_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:my_pertamini/src/iu/views/widgets/textfield.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  static const routeName = "/login-view";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
            child: SingleChildScrollView(
              child: Form(
                key: vm.keyForm,
                child: Column(
                  children: [
                    verticalSpace(SDP.sdp(30.0)),
                    Image.asset(
                      illustrationLogin,
                      height: SDP.sdp(184.0),
                    ),
                    verticalSpace(SDP.sdp(35.0)),
                    Text('Selamat Datang', style: boldBluePrimaryStyle.copyWith(fontSize: SDP.sdp(22.0))),
                    verticalSpace(SDP.sdp(9.0)),
                    Text(
                      'Selamat datang, sebelum login pastikan kamu memasukan akun dengan benar.',
                      style: regulerBlackStyle.copyWith(
                        fontSize: SDP.sdp(text),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(SDP.sdp(27.0)),
                    KTextField(
                      label: Strings.labelEmail,
                      controller: vm.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      borderColor: BaseColors.hint,
                      placeholder: 'Masukkan email',
                      borderRadius: SDP.sdp(8),
                      validator: Validator.emailValidator,
                      maxLines: 1,
                    ),
                    verticalSpace(SDP.sdp(16.0)),
                    KTextField(
                      textInputAction: TextInputAction.done,
                      label: Strings.labelPassword,
                      controller: vm.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      borderColor: BaseColors.hint,
                      placeholder: 'Masukkan password',
                      borderRadius: SDP.sdp(8),
                      validator: Validator.passwordValidator,
                      maxLines: 1,
                      obscure: vm.isObsecure,
                      suffixIcon: InkWell(
                        onTap: () {
                          vm.isObsecure = !vm.isObsecure;
                          vm.notifyListeners();
                        },
                        child: vm.isObsecure ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      ),
                    ),
                    verticalSpace(SDP.sdp(50.0)),
                    Button(
                      isLoading: vm.isBusy,
                      onPressed: () => vm.validate(
                        email: vm.emailController.text,
                        password: vm.passwordController.text,
                      ),
                      color: BaseColors.primaryBlue,
                      child: Center(
                        child: Text(
                          Strings.actionLogin,
                          style: TextStyle(
                            color: BaseColors.white,
                            fontSize: SDP.sdp(textS),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(SDP.sdp(50.0)),
                    Row(
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: regulerBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                        ),
                        InkWell(
                          onTap: () => vm.showRegisView(),
                          child: Text(
                            ' Silahkan Daftar',
                            style: regulerBluePrimaryStyle.copyWith(fontSize: SDP.sdp(text)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
