import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/component/app_button.dart';
import 'package:flutter_nfc_task/const/app_routes.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';
import 'package:flutter_nfc_task/utils/route_manager.dart';

class PremiumBottomSheet extends StatefulWidget {
  const PremiumBottomSheet({
    super.key,
  });

  @override
  State<PremiumBottomSheet> createState() => _PremiumBottomSheetState();
}

class _PremiumBottomSheetState extends State<PremiumBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                AppRouteManager.pop();
              },
              icon: const CircleAvatar(
                radius: 12,
                backgroundColor: AppColor.black,
                child: Icon(Icons.close, size: 12),
              ),
              color: AppColor.black,
            ),
          ),
          Image.asset(AppImage.icPremium.pathPNG(), height: 100, width: 100, color: AppColor.orange),
          14.vs,
          Text(
            'Tap the credit card on the phone to pay',
            style: AppTextStyle.bold22TextStyle.copyWith(color: AppColor.black),
            textAlign: TextAlign.center,
          ),
          20.vs,
          const Text('Please enable the NFC to get the device details'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
            child: AppButton(
                buttonName: 'Scan Card',
                onTap: () {
                  AppRouteManager.pop();
                  AppRouteManager.pushNamed(AppRoutes.cardInfoCollectScreen);
                }),
          )
        ],
      ),
    );
  }
}
