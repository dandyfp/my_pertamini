import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/main/main_view.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:my_pertamini/src/iu/views/widgets/textfield.dart';

class LoginView extends StatelessWidget {
  static const routeName = "/login-view";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    SDP.init(context);
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(SDP.sdp(100.0)),
              Text(
                Strings.labelInputLogin,
                style: TextStyle(
                  color: BaseColors.primary,
                  fontSize: SDP.sdp(body),
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(SDP.sdp(70.0)),
              KTextField(
                label: Strings.labelEmail,
                controller: emailController,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan email',
              ),
              verticalSpace(SDP.sdp(40.0)),
              KTextField(
                label: Strings.labelPassword,
                controller: passwordController,
                borderColor: BaseColors.hint,
                placeholder: 'Masukkan password',
              ),
              verticalSpace(SDP.sdp(70.0)),
              Button(
                onPressed: () => Navigator.pushNamed(context, MainView.routeName),
                color: BaseColors.primary,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
