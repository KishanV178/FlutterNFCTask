import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/component/app_button.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';
import 'package:flutter_nfc_task/utils/route_manager.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24),
        child: AppButton(buttonName: 'Back to home', onTap: () {
          AppRouteManager.pop();
        }),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImage.icRight.pathJPG(), height: 120, width: 120),
            10.vs,
            Text('Congratulations!',
                style: AppTextStyle.bold28TextStyle.copyWith(color: AppColor.black)),
            14.vs,
            Text('Payment received',
                style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.black))
          ],
        ),
      ),
    );
  }
}
