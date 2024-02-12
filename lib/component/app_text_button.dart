import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';

class AppTextButton extends StatelessWidget {
  final String buttonName;
  final IconData imageName;

  const AppTextButton({
    super.key,
    required this.buttonName,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.fadeOrange,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(imageName, size: 18),
          6.hs,
          Text(buttonName),
        ],
      ),
    );
  }
}
