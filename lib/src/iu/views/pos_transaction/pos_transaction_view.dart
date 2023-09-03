import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/date_time_format.dart';
import 'package:my_pertamini/src/iu/views/pos_transaction/pos_transaction_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class PosTransactionView extends StatelessWidget {
  const PosTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PosTransactionViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            ' Transaction',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            var date = FormatDate().formatDate(item.date, context: 'yyyy-MM-dd');
                            return Padding(
                              padding: EdgeInsets.only(bottom: SDP.sdp(6.0)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style: mediumBlackStyle.copyWith(
                                      fontSize: SDP.sdp(textS),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Id Pelanggan',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        'Nama',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        'Total Bayar',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        'Tanggal',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        'BBM',
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
                                        ': P00${item.user?.id}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        ': ${item.user?.name}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        ': ${item.amount}',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
                                      Text(
                                        ': $date',
                                        style: mediumBlackStyle.copyWith(
                                          fontSize: SDP.sdp(textS),
                                        ),
                                      ),
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
