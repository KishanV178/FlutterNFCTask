import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';

class PaymentCardView extends StatelessWidget {
  const PaymentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Stack(
        children: [
          Image.asset(AppImage.icAddCardBg.pathPNG(), fit: BoxFit.cover, width: double.infinity),
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.vs,
                Text(
                  'Card number',
                  style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.white),
                ),
                8.vs,
                Text(
                  'XXXX XXXX XXXX XXXX',
                  style: AppTextStyle.medium16TextStyle.copyWith(color: AppColor.white),
                ),
                50.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your name',
                          style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.white),
                        ),
                        4.vs,
                        Text(
                          'KISHAN GAJJAR',
                          style: AppTextStyle.bold16TextStyle.copyWith(color: AppColor.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry',
                          style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.white),
                        ),
                        4.vs,
                        Text(
                          'MM/YY',
                          style: AppTextStyle.bold16TextStyle.copyWith(color: AppColor.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
