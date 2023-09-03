import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/views/order/transaction_order_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionOrderView extends StatelessWidget {
  const TransactionOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransactionOrderViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
