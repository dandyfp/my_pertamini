import 'package:flutter/material.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class ItemMyFuel extends StatelessWidget {
  const ItemMyFuel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SDP.sdp(49.0),
      decoration: BoxDecoration(
        color: BaseColors.primaryBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          SDP.sdp(textXS),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: SDP.sdp(11.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icFuel,
              height: SDP.sdp(23.0),
            ),
            horizontalSpace(SDP.sdp(11.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bahan Bakar Pertamax',
                  style: boldBlackStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                Text(
                  'Oktan Number 92',
                  style: mediumBluePrimaryStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
