import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pertamini/src/iu/shared/style.dart';

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/ui_helpers.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.obscure = false,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.placeholder,
    this.maxLines,
    this.minLines = 1,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.error = false,
    this.controller,
    this.borderColor = Colors.transparent,
    this.borderRadius = 6.0,
    this.backgroundColor = Colors.white,
    this.padding,
    this.placeholderStyle,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.isDense = false,
    this.autofocus = false,
    this.elevation = 0.0,
    this.enabled = true,
    this.maxLength,
    this.onTap,
    this.isOption = false,
    this.textAlign,
  }) : super(key: key);

  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool obscure;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? placeholder;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final TextInputType keyboardType;
  final String? errorText;
  final bool error;
  final TextEditingController? controller;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? placeholderStyle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool isDense;
  final double elevation;
  final VoidCallback? onTap;
  final bool isOption;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label ?? '', style: boldGreyStyle.copyWith(fontSize: SDP.sdp(textS))) : Container(),
        label != null ? verticalSpace(SDP.sdp(4.0)) : Container(),
        Material(
          elevation: elevation,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Theme(
            data: ThemeData(primaryColor: BaseColors.primary),
            child: TextFormField(
              readOnly: isOption,
              enabled: enabled,
              showCursor: !isOption,
              enableInteractiveSelection: !isOption,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              style: TextStyle(fontSize: SDP.sdp(textHint)),
              obscureText: obscure,
              textAlignVertical: TextAlignVertical.center,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              validator: validator,
              inputFormatters: inputFormatters,
              autofocus: autofocus,
              onTap: () {
                if (onTap != null) onTap!();
              },
              decoration: InputDecoration(
                isDense: isDense,
                errorStyle: TextStyle(
                  fontSize: SDP.sdp(textHint),
                ),
                hintText: placeholder,
                hintStyle: placeholderStyle ??
                    TextStyle(
                      color: BaseColors.hint,
                      fontSize: SDP.sdp(textHint),
                    ),
                filled: true,
                fillColor: enabled ? backgroundColor : BaseColors.disableTextField,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: SDP.sdp(10.0),
                    right: SDP.sdp(10.0),
                  ),
                  child: prefixIcon,
                ),
                suffixIcon: suffixIcon,
                suffix: suffixText != null
                    ? Container(
                        margin: EdgeInsets.only(right: SDP.sdp(8.0)),
                        child: Text(
                          suffixText ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0.0,
                  maxHeight: 25.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: BaseColors.primary.withOpacity(0.35),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
