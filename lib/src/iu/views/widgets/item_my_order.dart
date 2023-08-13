import 'package:flutter/material.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class ItemMyOrder extends StatelessWidget {
  final String name;
  final String status;
  final String liter;
  const ItemMyOrder({
    super.key,
    required this.name,
    required this.status,
    required this.liter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SDP.sdp(60.0),
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: BaseColors.primaryBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          SDP.sdp(radius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SDP.sdp(10.0),
          vertical: SDP.sdp(9.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: SDP.sdp(34.0),
              child: Image.asset(icFuel),
            ),
            horizontalSpace(SDP.sdp(10.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: semiBoldBlackStyle.copyWith(
                      fontSize: SDP.sdp(text),
                    ),
                  ),
                  Text(
                    status,
                    style: mediumBluePrimaryStyle.copyWith(
                      fontSize: SDP.sdp(textS),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '$liter liter',
              style: semiBoldBlackStyle.copyWith(
                color: BaseColors.primaryBlue,
                fontSize: SDP.sdp(text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
