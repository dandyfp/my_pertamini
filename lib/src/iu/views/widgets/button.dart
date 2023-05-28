import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../../../helpers/scalable_dp_helper.dart';
import '../../shared/colors.dart';
import '../../shared/dimens.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.child,
    this.color = BaseColors.background,
    this.margin,
    this.padding,
    this.borderRadius,
    this.onPressed,
    this.border,
    this.isLoading = false,
    this.loadingColor = Colors.white,
    this.boxShadow,
    this.height,
    this.width,
    this.isDisabled = false,
  }) : super(key: key);

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final Color color;
  final BorderRadius? borderRadius;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final bool isLoading;
  final Color loadingColor;
  final List<BoxShadow>? boxShadow;
  final double? height;
  final double? width;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      height: height ?? 48.0,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              SDP.sdp(radius),
            ),
        color: isDisabled || isLoading ? BaseColors.disable : color,
        border: border,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius ??
              BorderRadius.circular(
                SDP.sdp(radius),
              ),
          onTap: isDisabled || isLoading ? null : onPressed,
          enableFeedback: isDisabled || isLoading ? false : true,
          child: Padding(
            padding: padding ?? EdgeInsets.all(SDP.sdp(6.0)),
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: SDP.sdp(paddingSmall),
                      width: SDP.sdp(paddingSmall),
                      child: Platform.isIOS
                          ? CupertinoActivityIndicator(
                              color: loadingColor,
                            )
                          : CircularProgressIndicator(
                              color: loadingColor,
                            ),
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
