import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    this.textStyle,
    this.prefixIcon,
    this.isDisabled = false,
    this.height = 55.0,
    this.width = double.infinity,
    this.textColor = AppColor.white,
    this.backgroundColor = AppColor.primary,
    this.borderColor = AppColor.transparent,
    this.isCircular = false,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback? onTap;
  final bool isDisabled;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String? prefixIcon;
  final double height;
  final double width;
  final TextStyle? textStyle;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: borderColor)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: textStyle ?? AppTextStyle.medium16TextStyle.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
