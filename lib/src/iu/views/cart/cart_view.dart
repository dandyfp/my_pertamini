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
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewmodel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: BaseColors.primaryBlue,
          title: Text(
            'Transaksi',
            style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(headline)),
          ),
        ),
        body: vm.isBusy
            ? Center(child: showLoading)
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: SingleChildScrollView(
                  child: vm.user?.type != 'admin'
                      ? Column(
                          children: [
                            verticalSpace(SDP.sdp(20.0)),
                            vm.myTransaction.isEmpty
                                ? Center(
                                    child: Text(
                                      'Belum ada transaksi',
                                      style: mediumBlackStyle.copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontSize: SDP.sdp(text),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: vm.myTransaction.length,
                                    itemBuilder: (context, index) {
                                      var item = vm.myTransaction[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                        child: ItemTransaction(
                                          data: item,
                                          admin: vm.user?.type ?? '',
                                          nameOrder: item.user?.name ?? '',
                                        ),
                                      );
                                    },
                                  )
                          ],
                        )
                      : Column(
                          children: [
                            verticalSpace(SDP.sdp(20.0)),
                            vm.allTransaction.isEmpty
                                ? Center(
                                    child: Text(
                                      'Belum ada transaksi',
                                      style: mediumBlackStyle.copyWith(
                                        fontStyle: FontStyle.italic,
                                        fontSize: SDP.sdp(text),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: vm.allTransaction.length,
                                    itemBuilder: (context, index) {
                                      var item = vm.allTransaction[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                        child: ItemTransaction(
                                          data: item,
                                          nameOrder: item.user?.name ?? "",
                                          admin: vm.user?.type,
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
