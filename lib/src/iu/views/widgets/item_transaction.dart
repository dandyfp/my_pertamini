import 'package:flutter/material.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SDP.sdp(60.0),
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: BaseColors.grey.withOpacity(0.2),
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
            Icon(
              Icons.arrow_outward_sharp,
              size: SDP.sdp(34.0),
              color: BaseColors.red,
            ),
            horizontalSpace(SDP.sdp(10.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bahan Bakar',
                    style: semiBoldBlackStyle.copyWith(
                      fontSize: SDP.sdp(text),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Tanggal',
                        style: mediumBlackStyle.copyWith(
                          fontSize: SDP.sdp(textS),
                        ),
                      ),
                      horizontalSpace(SDP.sdp(20.0)),
                      Text(
                        '1 liter',
                        style: mediumBlackStyle.copyWith(
                          fontSize: SDP.sdp(textS),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'RP 12.000',
              style: boldBlackStyle.copyWith(
                fontSize: SDP.sdp(text),
                color: BaseColors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
