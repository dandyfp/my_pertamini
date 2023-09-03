import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/profile/profile_viewmodel.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';
import 'package:my_pertamini/src/services/request/vehicle_req.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/validator/validator.dart';
import '../widgets/item_my_order.dart';
import '../widgets/item_transaction.dart';
import '../widgets/textfield.dart';

class ProfileView extends StatelessWidget {
  final VoidCallback? onTapToCartView;
  static const String routeName = "/profile-view";
  const ProfileView({
    super.key,
    this.onTapToCartView,
  });

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, vm, child) => Scaffold(
        body: vm.fetchUser
            ? Center(child: showLoading)
            : RefreshIndicator(
                onRefresh: () => vm.onRefresh(),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: SDP.sdp(253.0),
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                color: BaseColors.primaryBlue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    SDP.sdp(35.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(SDP.sdp(40.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Profile',
                                          style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(22.0)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.logout,
                                              color: BaseColors.white,
                                            ),
                                            GestureDetector(
                                              onTap: () => vm.logut(),
                                              child: Text(
                                                'Logout',
                                                style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(text)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    verticalSpace(SDP.sdp(22.0)),
                                    Text(
                                      vm.user?.name ?? '',
                                      style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(textL)),
                                    ),
                                    Text(
                                      vm.user?.email ?? '',
                                      style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(text)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: SDP.sdp(180)),
                                child: Container(
                                  width: SDP.sdp(340.0),
                                  decoration: BoxDecoration(
                                    color: BaseColors.white,
                                    borderRadius: BorderRadius.circular(
                                      SDP.sdp(radius),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: BaseColors.primaryBlue.withOpacity(0.3),
                                        blurRadius: 15.0,
                                        offset: const Offset(0, 10.0),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(SDP.sdp(18.0)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Informasi Kendaraan',
                                              style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (vm.myVehicle == null) {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    isDismissible: true,
                                                    useSafeArea: true,
                                                    backgroundColor: BaseColors.white,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.vertical(top: Radius.circular(SDP.sdp(10.0)))),
                                                    context: context,
                                                    builder: (context) {
                                                      return BottomSheetVehicle(
                                                        vm: vm,
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Icon(
                                                Icons.edit_square,
                                                color: BaseColors.grey,
                                              ),
                                            )
                                          ],
                                        ),
                                        verticalSpace(SDP.sdp(text)),
                                        Row(
                                          children: [
                                            Container(
                                              height: SDP.sdp(70.0),
                                              width: SDP.sdp(70.0),
                                              decoration: BoxDecoration(
                                                color: BaseColors.primaryBlue.withOpacity(0.3),
                                                borderRadius: BorderRadius.circular(
                                                  SDP.sdp(10.0),
                                                ),
                                              ),
                                              child: vm.myVehicle?.typeVehicle == 'MOTOR'
                                                  ? Icon(
                                                      Icons.motorcycle_outlined,
                                                      size: SDP.sdp(40.0),
                                                      color: BaseColors.primaryBlue,
                                                    )
                                                  : Icon(
                                                      Icons.car_repair_outlined,
                                                      size: SDP.sdp(40.0),
                                                      color: BaseColors.primaryBlue,
                                                    ),
                                            ),
                                            horizontalSpace(SDP.sdp(11)),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  vm.myVehicle?.nameBrand ?? '-',
                                                  style: boldBlackStyle.copyWith(
                                                    fontSize: SDP.sdp(body),
                                                  ),
                                                ),
                                                Text(
                                                  'Personal',
                                                  style: regulerGreyStyle.copyWith(
                                                    fontSize: SDP.sdp(text),
                                                  ),
                                                ),
                                                verticalSpace(SDP.sdp(11.0)),
                                                Text(
                                                  vm.myVehicle?.numberVehicle ?? '-',
                                                  style: boldBluePrimaryStyle.copyWith(
                                                    fontSize: SDP.sdp(text),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                          child: vm.user?.type != 'admin'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(
                                      SDP.sdp(28.0),
                                    ),
                                    Text(
                                      'Pesanan Saya',
                                      style: boldBlackStyle.copyWith(
                                        fontSize: SDP.sdp(body),
                                      ),
                                    ),
                                    verticalSpace(SDP.sdp(6.0)),
                                    vm.myOrder.isEmpty
                                        ? Text(
                                            'Belum ada pesanan',
                                            style: mediumBlackStyle.copyWith(
                                              fontStyle: FontStyle.italic,
                                              fontSize: SDP.sdp(text),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: vm.myOrder.length,
                                            itemBuilder: (context, index) {
                                              var item = vm.myOrder[index];
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                                child: InkWell(
                                                  onTap: () => vm.showStatusOrderView(
                                                    dataOrder: item,
                                                    numberOktan: item.numberOktan.toString(),
                                                    nameFuel: item.nameFuel ?? '',
                                                  ),
                                                  child: ItemMyOrder(
                                                    liter: item.liter.toString(),
                                                    name: item.nameFuel ?? '',
                                                    status: item.status ?? '',
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                    verticalSpace(SDP.sdp(25)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Riwayat Transaksi',
                                          style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                                        ),
                                        InkWell(
                                          onTap: () => vm.showCartView(),
                                          child: Text(
                                            'Lihat Semua',
                                            style: regulerBluePrimaryStyle.copyWith(
                                              fontSize: SDP.sdp(body),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(SDP.sdp(6.0)),
                                    vm.myOrder.isEmpty
                                        ? Text(
                                            'Belum ada transaksi',
                                            style: mediumBlackStyle.copyWith(
                                              fontStyle: FontStyle.italic,
                                              fontSize: SDP.sdp(text),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: vm.myTransaction.length >= 3 ? 3 : vm.myTransaction.length,
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
                                    //ItemTransaction(),
                                    //LottieBuilder.asset(successAnimation)
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(SDP.sdp(20.0)),
                                    Text(
                                      'Pesanan Untuk Dikirim',
                                      style: boldBlackStyle.copyWith(
                                        fontSize: SDP.sdp(body),
                                      ),
                                    ),
                                    verticalSpace(SDP.sdp(10.0)),
                                    vm.orderOnProcess.isEmpty
                                        ? Text(
                                            'Belum ada pesanan untuk dikirim',
                                            style: regulerBlackStyle.copyWith(
                                              fontSize: SDP.sdp(text),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: vm.orderOnProcess.length,
                                            itemBuilder: (context, index) {
                                              var item = vm.orderOnProcess[index];
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                                child: InkWell(
                                                  onTap: () => vm.showStatusOrderView(
                                                    dataOrder: item,
                                                    numberOktan: item.numberOktan.toString(),
                                                    nameFuel: item.nameFuel ?? '',
                                                  ),
                                                  child: ItemMyOrder(
                                                    liter: item.liter.toString(),
                                                    name: item.nameFuel ?? '',
                                                    status: item.status ?? '',
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                    verticalSpace(SDP.sdp(20.0)),
                                    Text(
                                      'Pesanan Telah Diterima',
                                      style: boldBlackStyle.copyWith(
                                        fontSize: SDP.sdp(body),
                                      ),
                                    ),
                                    verticalSpace(SDP.sdp(10.0)),
                                    vm.orderReceived.isEmpty
                                        ? Text(
                                            'Belum ada pesanan untuk dikirim',
                                            style: regulerBlackStyle.copyWith(
                                              fontSize: SDP.sdp(text),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: vm.orderReceived.length,
                                            itemBuilder: (context, index) {
                                              var item = vm.orderReceived[index];
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: SDP.sdp(4.0)),
                                                child: InkWell(
                                                  onTap: () => vm.showStatusOrderView(
                                                    dataOrder: item,
                                                    numberOktan: '90',
                                                    nameFuel: item.nameFuel ?? '',
                                                  ),
                                                  child: ItemMyOrder(
                                                    liter: item.liter.toString(),
                                                    name: item.nameFuel ?? '',
                                                    status: item.status ?? '',
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                    verticalSpace(SDP.sdp(25)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Riwayat Transaksi',
                                          style: boldBlackStyle.copyWith(fontSize: SDP.sdp(body)),
                                        ),
                                        InkWell(
                                          onTap: () => vm.showCartView(),
                                          child: Text(
                                            'Lihat Semua',
                                            style: regulerBluePrimaryStyle.copyWith(
                                              fontSize: SDP.sdp(body),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(SDP.sdp(6.0)),
                                    vm.allTransaction.isEmpty
                                        ? Text(
                                            'Belum ada transaksi',
                                            style: mediumBlackStyle.copyWith(
                                              fontStyle: FontStyle.italic,
                                              fontSize: SDP.sdp(text),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: vm.allTransaction.length >= 3 ? 3 : vm.allTransaction.length,
                                            itemBuilder: (context, index) {
                                              var item = vm.allTransaction[index];
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
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class BottomSheetVehicle extends StatefulWidget {
  final ProfileViewModel vm;
  const BottomSheetVehicle({
    super.key,
    required this.vm,
  });

  @override
  State<BottomSheetVehicle> createState() => _BottomSheetVehicleState();
}

class _BottomSheetVehicleState extends State<BottomSheetVehicle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Padding(
        padding: EdgeInsets.only(
          right: SDP.sdp(padding),
          left: SDP.sdp(padding),
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(SDP.sdp(20.0)),
            Text(
              'Jenis kendaraan',
              style: mediumBlackStyle.copyWith(
                fontSize: SDP.sdp(text),
              ),
            ),
            verticalSpace(SDP.sdp(4.0)),
            DropdownSearch(
              onChanged: (value) {
                setState(() {
                  widget.vm.typeVehicle = value;
                });
              },
              popupProps: const PopupProps.menu(fit: FlexFit.loose),
              items: const ['MOTOR', 'MOBIL'],
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
            verticalSpace(SDP.sdp(4)),
            Text(
              'Nama kendaraan',
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
              placeholder: 'Masukan nama kendaraan',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: widget.vm.nameVehicleController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(10.0)),
            Text(
              'Merek kendaraan',
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
              placeholder: 'Masukan merek kendaraan',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: widget.vm.brancVehicleController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(10.0)),
            Text(
              'Nomor kendaraan',
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
              placeholder: 'Masukan nomor kendaraan',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              controller: widget.vm.numberVehicleController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(30.0)),
            Button(
              onPressed: () {
                VehicleReq req = VehicleReq(
                  userId: widget.vm.user!.id.toString(),
                  nameBrand: widget.vm.nameVehicleController.text,
                  numberVehicle: widget.vm.numberVehicleController.text,
                  typeVehicle: widget.vm.typeVehicle,
                );
                widget.vm.createMyVehicle(req);
              },
              color: BaseColors.primaryBlue,
              borderRadius: BorderRadius.circular(
                SDP.sdp(radius),
              ),
              child: Center(
                child: Text(
                  'Simpan',
                  style: mediumWhiteStyle.copyWith(
                    fontSize: SDP.sdp(13.0),
                  ),
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
