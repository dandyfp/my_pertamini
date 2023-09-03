import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/pos/pos_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PosView extends StatelessWidget {
  const PosView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PosViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Laporan',
            style: boldWhiteStyle.copyWith(
              fontSize: SDP.sdp(headline),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: Column(
            children: [
              verticalSpace(SDP.sdp(49.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () => vm.showPosPeopleView(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColors.primaryBlue.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(SDP.sdp(25.0)),
                            child: Image.asset(
                              logoPosPeople,
                              height: SDP.sdp(90.0),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(SDP.sdp(18.0)),
                      InkWell(
                        onTap: () => vm.showPosTransactionView(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColors.primaryBlue.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(SDP.sdp(25.0)),
                            child: Image.asset(
                              logoPosTransaction,
                              height: SDP.sdp(90.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () => vm.showPosFuelView(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColors.primaryBlue.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(SDP.sdp(25.0)),
                            child: Image.asset(
                              logoPosFuel,
                              height: SDP.sdp(90.0),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(SDP.sdp(18.0)),
                      InkWell(
                        onTap: () => vm.showPosDeliveryView(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: BaseColors.primaryBlue.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(SDP.sdp(25.0)),
                            child: Image.asset(
                              logoPosDelivery,
                              height: SDP.sdp(90.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
