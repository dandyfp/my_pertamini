import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/order/fuel_order_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/validator/validator.dart';
import '../../../models/fuel.dart';
import '../../shared/style.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class FuelOrderView extends StatelessWidget {
  const FuelOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FuelOrderViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(SDP.sdp(20.0)),
              Text(
                'Id Pelanggan : 9jidj55jb-7565gvfgh-12hjj',
                style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
              ),
              verticalSpace(SDP.sdp(4.0)),
              Text(
                'Pilih BBM',
                style: mediumBlackStyle.copyWith(
                  fontSize: SDP.sdp(text),
                ),
              ),
              verticalSpace(SDP.sdp(6.0)),
              DropdownSearch(
                dropdownBuilder: (context, selectedItem) {
                  return Text(selectedItem?.name ?? '');
                },
                items: vm.fuels,
                popupProps: PopupProps.menu(
                  fit: FlexFit.loose,
                  itemBuilder: (context, Fuel item, isSelected) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.name ?? '',
                        style: regulerBlackStyle.copyWith(
                          fontSize: SDP.sdp(textS),
                        ),
                      ),
                    );
                  },
                ),
                onChanged: (value) {},
              ),
              verticalSpace(SDP.sdp(10)),
              Text(
                'Jumlah liter',
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
                placeholder: 'Masukan jumlah liter',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: Validator.requiredValidator,
                controller: vm.literController,
              ),
              verticalSpace(SDP.sdp(20.0)),
              Text(
                'Stok awal ${vm.stok}',
                style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
              ),
              verticalSpace(SDP.sdp(4.0)),
              Text(
                'Sisa stok ${vm.allStok}',
                style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
              ),
              verticalSpace(SDP.sdp(4.0)),
              Text(
                'Buffer stok ${vm.bufferStok}',
                style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
              ),
              verticalSpace(SDP.sdp(20.0)),
              Button(
                onPressed: () => vm.showTransactionView(),
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
