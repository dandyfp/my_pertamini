import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/helpers/validator/validator.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/images.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/detail_order/detail_order_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:my_pertamini/src/iu/views/widgets/textfield.dart';
import 'package:my_pertamini/src/services/request/order_req.dart';
import 'package:stacked/stacked.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../models/fuel.dart';
import '../widgets/item_my_fuel.dart';

class DetailOrderView extends StatelessWidget {
  final String idUser;
  final Fuel fuel;
  const DetailOrderView({
    super.key,
    required this.fuel,
    required this.idUser,
  });

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
            child: Form(
              key: vm.keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemMyFuel(
                    name: fuel.name ?? '',
                    oktanNumber: fuel.numberOktan.toString(),
                  ),
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
                    controller: vm.nameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    validator: Validator.requiredValidator,
                  ),
                  verticalSpace(SDP.sdp(20.0)),
                  Text(
                    'Provinsi',
                    style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                  ),
                  DropdownSearch(
                    popupProps: const PopupProps.menu(fit: FlexFit.loose),
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
                    items: const ['JAWA BARAT', 'DKI JAKARTA', 'JAWA TENGAH'],
                    onChanged: (value) {
                      if (value != 'JAWA BARAT') {
                        vm.enableCity = false;
                        vm.enableSubdistrik = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Maaf saat ini lokasi masih belum tersedia'),
                          ),
                        );
                        vm.notifyListeners();
                      } else {
                        vm.province = value;
                        vm.enableCity = true;
                        vm.notifyListeners();
                      }
                    },
                  ),
                  verticalSpace(SDP.sdp(20.0)),
                  Text(
                    'Kota/Kabupaten',
                    style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                  ),
                  DropdownSearch(
                    popupProps: const PopupProps.menu(fit: FlexFit.loose),
                    items: const ['KABUPATEN BEKASI', 'KABUPATEN BOGOR', 'KABUPATEN CIANJUR'],
                    enabled: vm.enableCity,
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
                    onChanged: (value) {
                      if (value != 'KABUPATEN BOGOR') {
                        vm.enableSubdistrik = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Maaf saat ini lokasi masih belum tersedia'),
                          ),
                        );
                        vm.notifyListeners();
                      } else {
                        vm.city = value;
                        vm.enableSubdistrik = true;
                        vm.notifyListeners();
                      }
                    },
                  ),
                  verticalSpace(SDP.sdp(20.0)),
                  Text(
                    'Kecamatan',
                    style: mediumGreyStyle.copyWith(fontSize: SDP.sdp(textS)),
                  ),
                  DropdownSearch(
                    popupProps: const PopupProps.menu(fit: FlexFit.loose),
                    items: const ['KECAMATAN JONGGOL'],
                    enabled: vm.enableSubdistrik,
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
                    onChanged: (value) {
                      if (value != 'KECAMATAN JONGGOL') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Maaf saat ini lokasi masih belum tersedia'),
                          ),
                        );
                        vm.notifyListeners();
                      } else {
                        vm.subdistrik = value;
                        vm.notifyListeners();
                      }
                    },
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
                    controller: vm.detailAdressController,
                    validator: Validator.requiredValidator,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
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
                              enabled: false,
                              maxLines: 1,
                              borderColor: BaseColors.grey,
                              isDense: true,
                              borderRadius: SDP.sdp(8.0),
                              placeholder: 'Rp.12.000',
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              controller: vm.priceController..text = fuel.price.toString(),
                              onChanged: (value) {
                                var price = fuel.price ?? 0;
                                vm.setPriceApply(price.toString());
                                vm.notifyListeners();
                              },
                              validator: Validator.requiredValidator,
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
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              controller: vm.amountLiterController,
                              onChanged: (value) {
                                vm.amountLiter = int.parse(value);
                                if (value.isEmpty) {
                                  vm.grandTotal = 0;
                                  vm.notifyListeners();
                                } else {
                                  vm.grandTotal = ((fuel.price ?? 0) * int.parse(value));
                                }
                                vm.notifyListeners();
                              },
                              validator: Validator.requiredValidator,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  Center(
                    child: Text(
                      'Grand Total : ${vm.grandTotal}',
                      style: boldBlackStyle.copyWith(fontSize: SDP.sdp(text)),
                    ),
                  ),
                  verticalSpace(SDP.sdp(10.0)),
                  Text(
                    'Biaya kirim pertransaksi dikenakan sebesar Rp.5000\nGrand total diatas belum termasuk biaya kirim',
                    style: regulerBlackStyle.copyWith(fontSize: SDP.sdp(textXS)),
                  ),
                  verticalSpace(SDP.sdp(40.0)),
                  Button(
                    onPressed: () {
                      OrderReq req = OrderReq(
                        nameOrder: vm.nameController.text,
                        province: vm.province,
                        city: vm.city,
                        subdistrict: vm.subdistrik,
                        detailAddress: vm.detailAdressController.text,
                        price: fuel.price,
                        status: 'on prosses',
                        liter: vm.amountLiter,
                      );
                      vm.notifyListeners();
                      if (vm.keyForm.currentState?.validate() ?? false) {
                        showModalBottomSheet(
                          isDismissible: true,
                          useSafeArea: true,
                          backgroundColor: BaseColors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(SDP.sdp(10.0)))),
                          context: context,
                          builder: (context) {
                            return BottomSheetPaymentMethod(
                              fuelId: fuel.id ?? '',
                              userId: idUser,
                              vm: vm,
                              orderReq: req,
                            );
                          },
                        );
                      }
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
      ),
    );
  }
}

class BottomSheetPaymentMethod extends StatelessWidget {
  final String userId;
  final String fuelId;
  final OrderReq orderReq;
  final DetailOrderViewMoldel vm;
  const BottomSheetPaymentMethod({
    required this.vm,
    required this.orderReq,
    required this.fuelId,
    required this.userId,
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
              onTap: () => vm.createOrder(
                dataOrder: orderReq,
                idFuel: fuelId,
                idUser: userId,
              ),
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
              'Transfet Bank',
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
                //onTap: () => vm.showStatusOrderView(),
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
