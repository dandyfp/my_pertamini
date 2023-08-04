import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
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
          automaticallyImplyLeading: false,
          title: Text(
            'My Pertamini',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SDP.sdp(headline),
              color: BaseColors.primary,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Dandy',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: SDP.sdp(text),
                  ),
                ),
                verticalSpace(SDP.sdp(5)),
                Text(
                  'Silahkan pilih bahan bakar yang anda butuhkan',
                  style: TextStyle(
                    fontSize: SDP.sdp(textS),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(SDP.sdp(5.0)),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: SDP.sdp(10.0)),
                      child: ItemFuel(
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
