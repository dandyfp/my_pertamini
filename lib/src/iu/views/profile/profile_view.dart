import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/strings.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = "/profile-view";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: BaseColors.primary,
        title: Text(
          Strings.labelNameLogo,
          style: TextStyle(
            fontSize: SDP.sdp(headline),
            fontWeight: FontWeight.bold,
            color: BaseColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(
              SDP.sdp(10.0),
            ),
            Center(child: Image.asset(illustrationRegis)),
            const Text('Nama'),
            verticalSpace(SDP.sdp(20.0)),
            const Text('Email'),
            verticalSpace(SDP.sdp(20.0)),
            const Text('HP'),
            verticalSpace(SDP.sdp(20.0))
          ],
        ),
      ),
    );
  }
}
