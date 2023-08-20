import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/shared/dimens.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';
import 'package:my_pertamini/src/iu/shared/ui_helpers.dart';
import 'package:my_pertamini/src/iu/views/home/home_viewmodel.dart';
import 'package:my_pertamini/src/services/request/fuel_req.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/validator/validator.dart';
import '../widgets/button.dart';
import '../widgets/item_fuel.dart';
import '../widgets/textfield.dart';

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
          backgroundColor: BaseColors.primaryBlue,
          automaticallyImplyLeading: false,
        ),
        body: vm.fetchUser
            ? Center(child: showLoading)
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth(context),
                      height: SDP.sdp(150),
                      decoration: const BoxDecoration(
                        color: BaseColors.primaryBlue,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My Pertamini',
                                  style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(padding)),
                                ),
                                Icon(
                                  Icons.notifications_active,
                                  color: BaseColors.white,
                                  size: SDP.sdp(24.0),
                                )
                              ],
                            ),
                            verticalSpace(SDP.sdp(16.0)),
                            Text(
                              'Hi, ${vm.user?.name ?? ''}',
                              style: boldWhiteStyle.copyWith(fontSize: SDP.sdp(body)),
                            ),
                            verticalSpace(SDP.sdp(17.0)),
                            Container(
                              height: SDP.sdp(37),
                              decoration: BoxDecoration(
                                color: BaseColors.white,
                                borderRadius: BorderRadius.circular(
                                  SDP.sdp(textXS),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Silahkan pilih bahan bakar yang anda butuhkan',
                                  style: semiBoldGreyStyle.copyWith(
                                    fontSize: SDP.sdp(textS),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(SDP.sdp(30.0)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                      child: ListView.builder(
                        itemCount: vm.fuels.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = vm.fuels[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: SDP.sdp(10.0)),
                            child: ItemFuel(
                              onTapEdit: () => vm.getDetailFuel(item.id ?? ''),
                              isLoadingDelete: vm.isLoadingDelete,
                              isLoadingEdit: vm.isLoadingEdit,
                              onTapDelete: () => vm.deleteFuel(item.id ?? ''),
                              isAdmin: vm.isAdmin,
                              name: item.name ?? '',
                              description: item.description ?? '',
                              oktanNumber: item.numberOktan.toString(),
                              onTap: () {
                                //SharedPreferencesHelper().clearAll();
                                vm.showDetailOrderView(item, vm.user!.id.toString());
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpace(SDP.sdp(10.0)),
                    if (vm.user?.type == 'admin')
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                        child: Button(
                          onPressed: () {
                            vm.clearData();
                            FuelReq req = FuelReq(
                              name: vm.nameFuelController.text,
                              numberOktan: int.tryParse(vm.numberOktanController.text),
                              description: vm.descriptionController.text,
                              price: int.tryParse(vm.priceController.text),
                            );
                            vm.showBottomSheetCreateFuel(req: req, isEdit: false);
                          },
                          color: BaseColors.white,
                          border: Border.all(color: BaseColors.primaryBlue),
                          borderRadius: BorderRadius.circular(SDP.sdp(4)),
                          child: Center(
                            child: Text(
                              'Tambah Bahan Bakar',
                              style: mediumBluePrimaryStyle.copyWith(
                                fontSize: SDP.sdp(textS),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}

class BottomSheetCreateFuel extends StatelessWidget {
  final bool isEdit;
  final HomeViewModel vm;
  final FuelReq req;
  final String id;
  const BottomSheetCreateFuel({
    super.key,
    required this.vm,
    required this.id,
    required this.req,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Padding(
        padding: EdgeInsets.only(
          left: SDP.sdp(padding),
          right: SDP.sdp(padding),
          top: SDP.sdp(20.0),
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Nama Bahan Bakar',
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
              placeholder: 'Masukan Nama Bahan Bakar',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: vm.nameFuelController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(10.0)),
            Text(
              'Deskripsi Bahan Bakar',
              style: mediumBlackStyle.copyWith(
                fontSize: SDP.sdp(text),
              ),
            ),
            verticalSpace(SDP.sdp(4.0)),
            KTextField(
              maxLines: 3,
              minLines: 3,
              borderColor: BaseColors.grey,
              isDense: true,
              borderRadius: SDP.sdp(8.0),
              placeholder: 'Masukan Deskripsi',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: vm.descriptionController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(10.0)),
            Text(
              'Nomor Oktan Bahan Bakar',
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
              placeholder: 'Masukan Nama Bahan Bakar',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              controller: vm.numberOktanController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(10.0)),
            Text(
              'Harga Bahan Bakar',
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
              placeholder: 'Masukan Harga Bahan Bakar',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              controller: vm.priceController,
              validator: Validator.requiredValidator,
            ),
            verticalSpace(SDP.sdp(30.0)),
            Button(
              isLoading: vm.isLoadingCreate || vm.isLoadingEdit,
              onPressed: () {
                FuelReq request = FuelReq(
                  name: vm.nameFuelController.text,
                  numberOktan: int.tryParse(vm.numberOktanController.text),
                  description: vm.descriptionController.text,
                  price: int.tryParse(vm.priceController.text),
                );
                isEdit == false ? vm.createFuel(request) : vm.updateFuel(req: request, id: id);
              },
              color: BaseColors.primaryBlue,
              borderRadius: BorderRadius.circular(SDP.sdp(radius)),
              child: Center(
                child: Text(
                  'Simpan',
                  style: mediumWhiteStyle.copyWith(
                    fontSize: SDP.sdp(13.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
