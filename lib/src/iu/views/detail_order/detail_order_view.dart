import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/detail_order/detail_order_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:my_pertamini/src/iu/views/widgets/textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../widgets/item_my_fuel.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DetailOrderViewMoldel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
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
                  'Detail Pemesanan',
                  style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ItemMyFuel(),
                verticalSpace(SDP.sdp(11.0)),
                Text(
                  'Alamat',
                  style: boldBlackStyle.copyWith(fontSize: textS),
                ),
                Text(
                  'Isi lengkap detail alamat penerima mu disini ya',
                  style: regulerGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                verticalSpace(SDP.sdp(17.0)),
                Text(
                  'Nama',
                  style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                KTextField(
                  borderColor: BaseColors.grey,
                  isDense: true,
                  borderRadius: SDP.sdp(8.0),
                  placeholder: 'Masukan nama pemesan',
                ),
                verticalSpace(SDP.sdp(20.0)),
                Text(
                  'Provinsi',
                  style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                DropdownSearch(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih',
                      hintStyle: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                      fillColor: BaseColors.grey,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SDP.sdp(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(SDP.sdp(20.0)),
                Text(
                  'Kota/Kabupaten',
                  style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                DropdownSearch(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih',
                      hintStyle: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                      fillColor: BaseColors.grey,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SDP.sdp(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(SDP.sdp(20.0)),
                Text(
                  'Kecamatan',
                  style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                DropdownSearch(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih',
                      hintStyle: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                      fillColor: BaseColors.grey,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SDP.sdp(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(SDP.sdp(20.0)),
                Text(
                  'Detail alamat',
                  style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                ),
                KTextField(
                  borderColor: BaseColors.grey,
                  isDense: true,
                  minLines: 3,
                  borderRadius: SDP.sdp(8.0),
                  placeholder: 'Cth: Patokan, nama jalan..',
                ),
                verticalSpace(SDP.sdp(20.0)),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                          ),
                          KTextField(
                            borderColor: BaseColors.grey,
                            isDense: true,
                            borderRadius: SDP.sdp(8.0),
                            placeholder: 'Rp.12.000',
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(SDP.sdp(4.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jumlah liter',
                            style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                          ),
                          KTextField(
                            borderColor: BaseColors.grey,
                            isDense: true,
                            borderRadius: SDP.sdp(8.0),
                            placeholder: 'Satuan liter',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(SDP.sdp(54.0)),
                Button(
                  onPressed: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      useSafeArea: true,
                      backgroundColor: BaseColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(SDP.sdp(10.0)))),
                      context: context,
                      builder: (context) {
                        return BottomSheetPaymentMethod(
                          vm: vm,
                        );
                      },
                    );
                  },
                  color: BaseColors.primaryBlue,
                  borderRadius: BorderRadius.circular(SDP.sdp(10.0)),
                  child: Center(
                    child: Text(
                      'Selanjutnya',
                      style: mediumWhiteStyle.copyWith(
                        fontSize: SDP.sdp(text),
                      ),
                    ),
                  ),
                ),
                verticalSpace(SDP.sdp(30.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetPaymentMethod extends StatelessWidget {
  final DetailOrderViewMoldel vm;
  const BottomSheetPaymentMethod({
    required this.vm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Padding(
        padding: EdgeInsets.only(
          left: SDP.sdp(padding),
          right: SDP.sdp(padding),
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(SDP.sdp(56.0)),
            Text(
              'Metode Pembayaran',
              style: boldBlackStyle.copyWith(
                fontSize: SDP.sdp(body),
              ),
            ),
            verticalSpace(SDP.sdp(body)),
            Text(
              'Cash On Delivery',
              style: boldGreyStyle.copyWith(fontSize: SDP.sdp(text)),
            ),
            verticalSpace(SDP.sdp(4.0)),
            GestureDetector(
              onTap: () => vm.showStatusOrderView(),
              child: Container(
                height: SDP.sdp(41.0),
                decoration: BoxDecoration(
                  color: BaseColors.primaryBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    SDP.sdp(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SDP.sdp(12.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bayar di tempat',
                        style: boldBlackStyle.copyWith(fontSize: SDP.sdp(textS)),
                      ),
                      const Icon(Icons.keyboard_arrow_right_outlined)
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(SDP.sdp(15.0)),
            Text(
              'Cash On Delivery',
              style: boldGreyStyle.copyWith(fontSize: SDP.sdp(text)),
            ),
            verticalSpace(SDP.sdp(4.0)),
            Container(
              height: SDP.sdp(41.0),
              decoration: BoxDecoration(
                color: BaseColors.primaryBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  SDP.sdp(10),
                ),
              ),
              child: InkWell(
                onTap: () => vm.showStatusOrderView(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SDP.sdp(12.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            logoBca,
                            height: SDP.sdp(10.0),
                          ),
                          Text(
                            'Belum Tersedia',
                            style: regulerGreyStyle.copyWith(fontSize: SDP.sdp(textS), fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      const Icon(Icons.keyboard_arrow_right_outlined)
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(SDP.sdp(5.0)),
            Container(
              height: SDP.sdp(41.0),
              decoration: BoxDecoration(
                color: BaseColors.primaryBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  SDP.sdp(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(12.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          logoBri,
                          height: SDP.sdp(10.0),
                        ),
                        Text(
                          'Belum Tersedia',
                          style: regulerGreyStyle.copyWith(fontSize: SDP.sdp(textS), fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                ),
              ),
            ),
            verticalSpace(SDP.sdp(30.0))
          ],
        ),
      ),
    );
  }
}
