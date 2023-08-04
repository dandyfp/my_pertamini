// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/views/widgets/button.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/ui_helpers.dart';

class ItemFuel extends StatelessWidget {
  final VoidCallback onTap;
  const ItemFuel({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: BaseColors.purpleSoft,
        ),
        borderRadius: BorderRadius.circular(
          SDP.sdp(radius),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: SDP.sdp(36.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  SDP.sdp(radius),
                ),
                topRight: Radius.circular(
                  SDP.sdp(radius),
                ),
                bottomRight: Radius.circular(
                  SDP.sdp(radius),
                ),
              ),
              color: BaseColors.purpleSoft,
            ),
            child: Center(
                child: Text(
              'Pertamax',
              style: TextStyle(
                fontSize: SDP.sdp(textL),
                color: BaseColors.black,
                fontWeight: FontWeight.w600,
              ),
            )),
          ),
          verticalSpace(SDP.sdp(11.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SDP.sdp(20.0)),
            child: Text(
              'Pertamax sangat direkomendasikan untuk digunakan pada kendaraan yang memiliki kompresi rasio 10:1 hingga 11:1 atau kendaraan berbahan bakar bensin yang menggunakan teknologi setara dengan Electronic Fuel Injection (EFI)',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: SDP.sdp(textS),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          verticalSpace(SDP.sdp(6.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SDP.sdp(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp. 12.000',
                  style: TextStyle(fontSize: SDP.sdp(text), fontWeight: FontWeight.w500),
                ),
                Text(
                  'Oktan 92',
                  style: TextStyle(fontSize: SDP.sdp(text), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          verticalSpace(SDP.sdp(7.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              onPressed: onTap,
              border: Border.all(color: BaseColors.black),
              color: BaseColors.purpleSoft,
              borderRadius: BorderRadius.circular(SDP.sdp(4)),
              child: Center(
                child: Text(
                  'Pilih',
                  style: TextStyle(
                    fontSize: SDP.sdp(textS),
                    color: BaseColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
