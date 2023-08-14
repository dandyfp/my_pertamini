import 'package:flutter/material.dart';
import 'package:my_pertamini/src/models/transaction.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class ItemTransaction extends StatelessWidget {
  final Transaction data;
  const ItemTransaction({
    super.key,
    required this.data,
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
                    data.nameFuel ?? '',
                    style: semiBoldBlackStyle.copyWith(
                      fontSize: SDP.sdp(text),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        data.date ?? '',
                        style: mediumBlackStyle.copyWith(
                          fontSize: SDP.sdp(textS),
                        ),
                      ),
                      horizontalSpace(SDP.sdp(20.0)),
                      Text(
                        '${data.liter} liter',
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
              'RP ${data.amount}',
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
