import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/cart/cart_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/item_transaction.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/scalable_dp_helper.dart';

class CartView extends StatelessWidget {
  static const String routeName = "/cart-view";
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewmodel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: BaseColors.white,
          title: Text(
            'Transaksi',
            style: boldBluePrimaryStyle.copyWith(fontSize: SDP.sdp(headline)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(SDP.sdp(20.0)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: vm.myTransaction.length,
                  itemBuilder: (context, index) {
                    var item = vm.myTransaction[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                      child: ItemTransaction(
                        data: item,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
