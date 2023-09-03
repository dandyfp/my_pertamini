import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/date_time_format.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/views/pos_fuel/pos_fuel_viewmodel.dart';
import 'package:my_pertamini/src/models/fuel.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/style.dart';
import '../../shared/ui_helpers.dart';

class PosFuelView extends StatelessWidget {
  const PosFuelView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PosFuelViewModel(),
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Data BBM',
            style: boldWhiteStyle.copyWith(
              fontSize: SDP.sdp(headline),
            ),
          ),
        ),
        body: vm.fetchFuel
            ? Center(child: showLoading)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                  child: Column(
                    children: [
                      verticalSpace(SDP.sdp(30.0)),
                      SizedBox(
                        width: SDP.sdp(128.0),
                        child: Image.asset(logo),
                      ),
                      verticalSpace(SDP.sdp(20.0)),
                      DropdownSearch(
                        dropdownBuilder: (context, selectedItem) {
                          return Text(selectedItem?.name ?? '');
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                          hintText: vm.nameFuel,
                        )),
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
                        onChanged: (value) {
                          vm.getAllTransactionFuel(value?.id ?? '');
                          vm.stok = value?.stock ?? 0;
                          vm.nameFuel = value?.name ?? '';
                          vm.notifyListeners();
                        },
                      ),
                      verticalSpace(SDP.sdp(24.0)),
                      vm.allTransaction.isEmpty
                          ? Text(
                              'Belum ada transaksi',
                              style: mediumBlackStyle.copyWith(
                                fontSize: SDP.sdp(text),
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: vm.allTransaction.length,
                              itemBuilder: (context, index) {
                                var item = vm.allTransaction[index];
                                var date = FormatDate().formatDate(item.date);
                                return Padding(
                                  padding: EdgeInsets.only(bottom: SDP.sdp(6.0)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${index + 1}. ',
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
                                            'Jumlah Order',
                                            style: mediumBlackStyle.copyWith(
                                              fontSize: SDP.sdp(textS),
                                            ),
                                          ),
                                          Text(
                                            'Tanggal',
                                            style: mediumBlackStyle.copyWith(
                                              fontSize: SDP.sdp(textS),
                                            ),
                                          )
                                        ],
                                      ),
                                      horizontalSpace(SDP.sdp(4.0)),
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
                                            ': ${item.liter} Liter',
                                            style: mediumBlackStyle.copyWith(
                                              fontSize: SDP.sdp(textS),
                                            ),
                                          ),
                                          Text(
                                            ': $date',
                                            style: mediumBlackStyle.copyWith(
                                              fontSize: SDP.sdp(textS),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
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
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
