import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/views/order/user_order_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/validator/validator.dart';
import '../../shared/colors.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';
import '../widgets/textfield.dart';

class UserOrderView extends StatelessWidget {
  const UserOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserOrderViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(SDP.sdp(30.0)),
              /* Text(
                'Id Pelanggan',
                style: mediumBlackStyle.copyWith(
                  fontSize: SDP.sdp(text),
                ),
              ),
              verticalSpace(SDP.sdp(4.0)),
              KTextField(
                maxLines: 1,
                borderColor: BaseColors.grey,
                isDense: true,
                borderRadius: SDP.sdp(8.0),
                placeholder: 'Masukan id ',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                validator: Validator.requiredValidator,
                controller: vm.idController,
              ), */
              verticalSpace(SDP.sdp(10.0)),
              Text(
                'Nama',
                style: mediumBlackStyle.copyWith(
                  fontSize: SDP.sdp(text),
                ),
              ),
              verticalSpace(SDP.sdp(4.0)),
              KTextField(
                maxLines: 1,
                borderColor: BaseColors.grey,
                isDense: true,
                borderRadius: SDP.sdp(8.0),
                placeholder: 'Masukan nama',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                controller: vm.nameController,
                validator: Validator.requiredValidator,
              ),
              verticalSpace(SDP.sdp(10.0)),
              Text(
                'Email',
                style: mediumBlackStyle.copyWith(
                  fontSize: SDP.sdp(text),
                ),
              ),
              verticalSpace(SDP.sdp(4.0)),
              KTextField(
                maxLines: 1,
                borderColor: BaseColors.grey,
                isDense: true,
                borderRadius: SDP.sdp(8.0),
                placeholder: 'Masukan email',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                validator: Validator.requiredValidator,
                controller: vm.emailController,
              ),
              verticalSpace(SDP.sdp(10.0)),
              Text(
                'Alamat',
                style: mediumBlackStyle.copyWith(
                  fontSize: SDP.sdp(text),
                ),
              ),
              verticalSpace(SDP.sdp(4.0)),
              KTextField(
                maxLines: 1,
                borderColor: BaseColors.grey,
                isDense: true,
                borderRadius: SDP.sdp(8.0),
                placeholder: 'Masukan alamat',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                validator: Validator.requiredValidator,
                controller: vm.addressController,
              ),
              verticalSpace(SDP.sdp(30.0)),
              Button(
                onPressed: () => vm.showFuelView(),
                color: BaseColors.primaryBlue,
                child: Center(
                  child: Text(
                    'Selanjutnya',
                    style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(text)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
