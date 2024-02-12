import 'package:flutter/material.dart';
import 'package:flutter_nfc_task/utils/app_color.dart';
import 'package:flutter_nfc_task/utils/app_image.dart';
import 'package:flutter_nfc_task/utils/app_text_style.dart';
import 'package:flutter_nfc_task/utils/extensions.dart';

class UserDetailCardView extends StatelessWidget {
  const UserDetailCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Stack(
        children: [
          Image.asset(AppImage.icCardBg.pathPNG(), fit: BoxFit.contain, width: double.infinity),
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank',
                      style: AppTextStyle.medium18TextStyle.copyWith(color: AppColor.red),
                    ),
                    Text(
                      'IND',
                      style: AppTextStyle.medium18TextStyle.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
                18.vs,
                Text(
                  'Primary account number',
                  style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.white),
                ),
                14.vs,
                Text(
                  '* * * * * F',
                  style: AppTextStyle.bold50TextStyle.copyWith(color: AppColor.white),
                ),
                10.vs,
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
                          'Kishan Gajjar',
                          style: AppTextStyle.medium12TextStyle
                              .copyWith(color: AppColor.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Card number',
                          style: AppTextStyle.medium14TextStyle.copyWith(color: AppColor.white),
                        ),
                        4.vs,
                        Text(
                          '1233434545654',
                          style: AppTextStyle.medium12TextStyle
                              .copyWith(color: AppColor.white.withOpacity(0.5)),
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
