import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets/item_my_order.dart';
import '../widgets/item_transaction.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = "/profile-view";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, vm, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: vm.fetchUser
                ? Center(child: showLoading)
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: SDP.sdp(253.0),
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                              color: BaseColors.primaryBlue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  SDP.sdp(35.0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpace(SDP.sdp(40.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Profile',
                                        style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(22.0)),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.logout,
                                            color: BaseColors.white,
                                          ),
                                          GestureDetector(
                                            onTap: () => vm.logut(),
                                            child: Text(
                                              'Logout',
                                              style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(text)),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  verticalSpace(SDP.sdp(22.0)),
                                  Text(
                                    vm.user?.name ?? '',
                                    style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(textL)),
                                  ),
                                  Text(
                                    vm.user?.email ?? '',
                                    style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(text)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: SDP.sdp(180)),
                              child: Container(
                                width: SDP.sdp(340.0),
                                decoration: BoxDecoration(
                                  color: BaseColors.white,
                                  borderRadius: BorderRadius.circular(
                                    SDP.sdp(radius),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: BaseColors.primaryBlue.withOpacity(0.3),
                                      blurRadius: 15.0,
                                      offset: const Offset(0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(SDP.sdp(18.0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Informasi Kendaraan',
                                            style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                                          ),
                                          const Icon(
                                            Icons.edit_square,
                                            color: BaseColors.grey,
                                          )
                                        ],
                                      ),
                                      verticalSpace(SDP.sdp(text)),
                                      Row(
                                        children: [
                                          Container(
                                            height: SDP.sdp(70.0),
                                            width: SDP.sdp(70.0),
                                            decoration: BoxDecoration(
                                              color: BaseColors.primaryBlue.withOpacity(0.3),
                                              borderRadius: BorderRadius.circular(
                                                SDP.sdp(10.0),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.motorcycle_outlined,
                                              size: SDP.sdp(40.0),
                                              color: BaseColors.primaryBlue,
                                            ),
                                          ),
                                          horizontalSpace(SDP.sdp(11)),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'MEREK',
                                                style: boldBlackStyle.copyWith(
                                                  fontSize: SDP.sdp(body),
                                                ),
                                              ),
                                              Text(
                                                'Personal',
                                                style: regulerGreyStyle.copyWith(
                                                  fontSize: SDP.sdp(text),
                                                ),
                                              ),
                                              verticalSpace(SDP.sdp(11.0)),
                                              Text(
                                                'NOM 02',
                                                style: boldBluePrimaryStyle.copyWith(
                                                  fontSize: SDP.sdp(text),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(
                              SDP.sdp(28.0),
                            ),
                            Text(
                              'Pesanan Saya',
                              style: boldBlackStyle.copyWith(
                                fontSize: SDP.sdp(body),
                              ),
                            ),
                            verticalSpace(SDP.sdp(6.0)),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: vm.myOrder.length,
                              itemBuilder: (context, index) {
                                var item = vm.myOrder[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                  child: InkWell(
                                    onTap: () => vm.showStatusOrderView(
                                      dataOrder: item,
                                      numberOktan: '90',
                                      nameFuel: item.nameFuel ?? '',
                                    ),
                                    child: ItemMyOrder(
                                      liter: item.liter.toString(),
                                      name: item.nameFuel ?? '',
                                      status: item.status ?? '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            verticalSpace(SDP.sdp(25)),
                            Row(
                              children: [
                                Text(
                                  'Riwayat Transaksi',
                                  style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                                )
                              ],
                            ),
                            verticalSpace(SDP.sdp(6.0)),
                            ItemTransaction(),
                            //LottieBuilder.asset(successAnimation)
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
