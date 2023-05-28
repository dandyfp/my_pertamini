import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/login/login_view.dart';
import 'package:my_pertamini/src/iu/views/register/regis_view.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';

import '../../../helpers/scalable_dp_helper.dart';

class LandingView extends StatelessWidget {
  static const String routeName = '/landing_view';
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SDP.sdp(paddingBig)),
        child: Column(
          children: [
            verticalSpace(
              SDP.sdp(77.0),
            ),
            Image.asset(illustrationMain),
            verticalSpace(SDP.sdp(30.0)),
            Text(
              Strings.labelWelcome,
              style: TextStyle(
                color: BaseColors.black,
                fontSize: SDP.sdp(body),
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(SDP.sdp(47)),
            Text(
              Strings.labelChooseLogin,
              style: TextStyle(
                color: BaseColors.red,
                fontSize: SDP.sdp(textS),
              ),
            ),
            verticalSpace(SDP.sdp(bodySmall)),
            Button(
              onPressed: () => Navigator.pushNamed(context, LoginView.routeName),
              color: BaseColors.primary,
              child: Center(
                child: Text(
                  Strings.actionLogin,
                  style: TextStyle(
                    color: BaseColors.white,
                    fontSize: SDP.sdp(textS),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            verticalSpace(SDP.sdp(47)),
            Text(
              Strings.labelChooseRegis,
              style: TextStyle(
                color: BaseColors.red,
                fontSize: SDP.sdp(textS),
              ),
            ),
            verticalSpace(SDP.sdp(bodySmall)),
            Button(
              onPressed: () => Navigator.pushNamed(context, RegisView.routeName),
              color: BaseColors.primary,
              child: Center(
                child: Text(
                  Strings.actionRegis,
                  style: TextStyle(
                    color: BaseColors.white,
                    fontSize: SDP.sdp(textS),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
