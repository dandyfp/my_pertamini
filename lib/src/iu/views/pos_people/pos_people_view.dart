import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/pos_people/pos_people_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/style.dart';

class PosPeopleView extends StatelessWidget {
  const PosPeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PosPeopleViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Data Pelanggan',
            style: boldWhiteStyle.copyWith(
              fontSize: SDP.sdp(headline),
            ),
          ),
        ),
        body: vm.isBusy
            ? Center(child: showLoading)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                  child: Column(
                    children: [
                      verticalSpace(SDP.sdp(30.0)),
                      SizedBox(
                        width: SDP.sdp(128.0),
                        child: Image.asset(logo),
                      ),
                      verticalSpace(SDP.sdp(24.0)),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: vm.allTransaction.length,
                          itemBuilder: (context, index) {
                            var item = vm.allTransaction[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: SDP.sdp(6.0)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1} .',
                                    style: mediumBlackStyle.copyWith(
                                      fontSize: SDP.sdp(textS),
                                    ),
                                  ),
                                  horizontalSpace(SDP.sdp(4.0)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        'Email',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      /* Text(
                                  'No Telpon',
                                  style: mediumBlackStyle.copyWith(
                                    fontSize: SDP.sdp(textS),
                                  ),
                                ), */
                                      Text(
                                        'Id Pelanggan',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ': ${item.user?.name}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        ': ${item.user?.email}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      /* Text(
                                  ': No Telpon',
                                  style: mediumBlackStyle.copyWith(
                                    fontSize: SDP.sdp(textS),
                                  ),
                                ), */
                                      Text(
                                        ': P00${item.user?.id}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
