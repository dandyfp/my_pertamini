import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../helpers/scalable_dp_helper.dart';
import '../../../shared/dimens.dart';
import '../../../shared/ui_helpers.dart';

class InformationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InformationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SDP.sdp(paddingSmall),
          vertical: SDP.sdp(32.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SDP.sdp(radiusButton)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            request.imageUrl != null
                ? Column(
                    children: [
                      LottieBuilder.asset(
                        request.imageUrl ?? '',
                        width: SDP.sdp(35.0),
                        height: SDP.sdp(35.0),
                      ),
                      verticalSpace(SDP.sdp(spaceSmall)),
                    ],
                  )
                : Container(),
            Text(
              request.title!,
              style: mediumBlackStyle.copyWith(
                fontSize: SDP.sdp(caption),
              ),
            ),
            verticalSpace(SDP.sdp(spaceSmall)),
            Text(
              request.description!,
              style: regulerBlackStyle.copyWith(
                fontSize: SDP.sdp(caption),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
