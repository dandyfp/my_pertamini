import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/splash_screen/splash_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../shared/images.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashSreenViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: SDP.sdp(52.0),
                width: SDP.sdp(223.0),
              ),
              verticalSpace(SDP.sdp(20.0)),
              showLoading
            ],
          ),
        ),
      ),
    );
  }
}
