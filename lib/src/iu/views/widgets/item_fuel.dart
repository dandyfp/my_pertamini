import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/ui_helpers.dart';

class ItemFuel extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String description;
  final String oktanNumber;
  final int? price;
  const ItemFuel({
    Key? key,
    required this.onTap,
    required this.name,
    required this.description,
    required this.oktanNumber,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: BaseColors.white),
        borderRadius: BorderRadius.circular(SDP.sdp(textXS)),
        boxShadow: [
          BoxShadow(
            color: BaseColors.primaryBlue.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0.0, 8.0),
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(SDP.sdp(12.0)),
            Text(
              name,
              style: boldBlackStyle.copyWith(fontSize: SDP.sdp(17.0)),
            ),
            verticalSpace(SDP.sdp(11.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SDP.sdp(71.0),
                  width: SDP.sdp(71.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SDP.sdp(5)),
                    color: BaseColors.primaryBlue.withOpacity(0.2),
                  ),
                  child: Center(
                      child: Image.asset(
                    icFuel,
                    height: SDP.sdp(34.0),
                  )),
                ),
                horizontalSpace(SDP.sdp(8.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SDP.sdp(190.0),
                      child: Text(
                        description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: regulerGreyStyle.copyWith(
                          fontSize: SDP.sdp(textXS),
                        ),
                      ),
                    ),
                    Text(
                      'Oktan Number $oktanNumber',
                      style: boldBluePrimaryStyle.copyWith(
                        fontSize: SDP.sdp(text),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(SDP.sdp(14.0)),
            Button(
              onPressed: onTap,
              color: BaseColors.primaryBlue,
              borderRadius: BorderRadius.circular(SDP.sdp(4)),
              child: Center(
                child: Text(
                  'Pilih',
                  style: mediumWhiteStyle.copyWith(
                    fontSize: SDP.sdp(textS),
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
