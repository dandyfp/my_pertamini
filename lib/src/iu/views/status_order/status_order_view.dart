import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/status_order/status_order_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/item_my_fuel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/dimens.dart';
import '../../shared/style.dart';

class StatusOrderView extends StatelessWidget {
  const StatusOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StatusOrderViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.only(
              left: SDP.sdp(padding),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => vm.back(),
                  child: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: SDP.sdp(24.0),
                  ),
                ),
                Text(
                  'Status Pemesanan',
                  style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SDP.sdp(92),
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: BaseColors.grey.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(SDP.sdp(8.0)),
                    Padding(
                      padding: EdgeInsets.only(left: SDP.sdp(padding)),
                      child: Text(
                        'Pesanan Dalam Pengiriman',
                        style: boldBluePrimaryStyle.copyWith(
                          fontSize: SDP.sdp(textS),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    verticalSpace(SDP.sdp(5)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SDP.sdp(padding),
                      ),
                      child: ItemMyFuel(),
                    ),
                  ],
                ),
              ),
              verticalSpace(SDP.sdp(26.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat',
                      style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                    ),
                    verticalSpace(SDP.sdp(5.0)),
                    Text(
                      'Jalan raya bogor',
                      style: regulerGreyStyle.copyWith(fontSize: SDP.sdp(text)),
                    ),
                    verticalSpace(SDP.sdp(14.0)),
                    Text(
                      'Metode Pembayaran',
                      style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                    ),
                    verticalSpace(SDP.sdp(5.0)),
                    Text(
                      'Cash On Delivery',
                      style: regulerGreyStyle.copyWith(fontSize: SDP.sdp(text)),
                    ),
                    verticalSpace(SDP.sdp(17.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harga',
                              style: mediumBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Jumlah Liter',
                              style: mediumBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Ongkos Kirim',
                              style: mediumBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Total Bayar',
                              style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Terbayar',
                              style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Rp.12000',
                              style: regulerGreyStyle.copyWith(
                                fontSize: SDP.sdp(text),
                              ),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              '2 Liter',
                              style: regulerGreyStyle.copyWith(
                                fontSize: SDP.sdp(text),
                              ),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Rp.5000',
                              style: regulerGreyStyle.copyWith(
                                fontSize: SDP.sdp(text),
                              ),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Rp.29000',
                              style: boldGreyStyle.copyWith(
                                fontSize: SDP.sdp(text),
                              ),
                            ),
                            verticalSpace(SDP.sdp(8)),
                            Text(
                              'Rp.0',
                              style: boldGreyStyle.copyWith(
                                fontSize: SDP.sdp(text),
                              ),
                            ),
                            verticalSpace(SDP.sdp(8)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
