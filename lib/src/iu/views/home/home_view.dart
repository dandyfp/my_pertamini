import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets/item_fuel.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/home-view";
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth(context),
                height: SDP.sdp(150),
                decoration: const BoxDecoration(
                  color: BaseColors.primaryBlue,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Pertamini',
                            style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(padding)),
                          ),
                          Icon(
                            Icons.notifications_active,
                            color: BaseColors.white,
                            size: SDP.sdp(24.0),
                          )
                        ],
                      ),
                      verticalSpace(SDP.sdp(16.0)),
                      Text(
                        'Hi, Name User',
                        style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(body)),
                      ),
                      verticalSpace(SDP.sdp(17.0)),
                      Container(
                        height: SDP.sdp(37),
                        decoration: BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.circular(
                            SDP.sdp(textXS),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Silahkan pilih bahan bakar yang anda butuhkan',
                            style: semiBoldGreyStyle.copyWith(
                              fontSize: SDP.sdp(textS),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpace(SDP.sdp(30.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: SDP.sdp(10.0)),
                      child: ItemFuel(
                        onTap: () {
                          vm.showDetailOrderView();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
